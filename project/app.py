import os
from cs50 import SQL
from flask import Flask, flash, redirect, render_template, request, session
from flask_session import Session
from werkzeug.security import check_password_hash, generate_password_hash
from helpers import apology, login_required

# Configure application
app = Flask(__name__)

# Configure session to use filesystem (instead of signed cookies)
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

# Configure CS50 Library to use SQLite database for the movie recommender
db = SQL("sqlite:///project.db")


@app.after_request
def after_request(response):
    """Ensure responses aren't cached"""
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Expires"] = 0
    response.headers["Pragma"] = "no-cache"
    return response


@app.route("/")
@login_required
def index():
    return render_template("layout.html")


@app.route("/recommend", methods=["GET", "POST"])
@login_required
def recommend():
    if request.method == "POST":
        mood = request.form.get("mood")
        if not mood:
            return apology("Please select a mood.")
        # Query movies matching the selected mood
        movies = db.execute("SELECT * FROM movies WHERE mood = ?", mood)
        # Log each recommendation to history for the user
        user_id = session["user_id"]
        for movie in movies:
            db.execute("INSERT INTO history (user_id, movie_id) VALUES (?, ?)", user_id, movie["id"])
        return render_template("results.html", movies=movies, mood=mood)
    else:
        return render_template("recommend.html")


@app.route("/history")
@login_required
def history():
    user_id = session["user_id"]
    history = db.execute("""
        SELECT movies.title, movies.mood, movies.imdb_url, h.when_searched
        FROM history h
        JOIN movies ON h.movie_id = movies.id
        WHERE h.user_id = ?
        ORDER BY h.when_searched DESC
    """, user_id)
    return render_template("history.html", history=history)


@app.route("/login", methods=["GET", "POST"])
def login():
    """Log user in"""

    # Forget any user_id
    session.clear()

    # User reached route via POST (as by submitting a form via POST)
    if request.method == "POST":
        # Ensure username was submitted
        if not request.form.get("username"):
            return apology("must provide username", 403)

        # Ensure password was submitted
        elif not request.form.get("password"):
            return apology("must provide password", 403)

        # Query database for username
        rows = db.execute(
            "SELECT * FROM users WHERE username = ?", request.form.get("username")
        )

        # Ensure username exists and password is correct
        if len(rows) != 1 or not check_password_hash(
            rows[0]["hash"], request.form.get("password")
        ):
            return apology("invalid username and/or password", 403)

        # Remember which user has logged in
        session["user_id"] = rows[0]["id"]

        # Redirect user to home page
        return redirect("/")

    # User reached route via GET (as by clicking a link or via redirect)
    else:
        return render_template("login.html")


@app.route("/logout")
def logout():
    """Log user out"""

    # Forget any user_id
    session.clear()

    # Redirect user to login form
    return redirect("/login")


@app.route("/register", methods=["GET", "POST"])
def register():
    """Register user"""
    # User reached route via POST, so process form submission
    if request.method == "POST":
        # Grab form inputs
        username = request.form.get("username")
        password = request.form.get("password")
        confirmation = request.form.get("confirmation")

        # Validate inputs
        if not username:
            return apology("must provide username", 400)
        if not password:
            return apology("must provide password", 400)
        if password != confirmation:
            return apology("passwords do not match", 400)

        # Hash password & attempt to insert new user
        try:
            hash_pw = generate_password_hash(password)
            new_id = db.execute(
                "INSERT INTO users (username, hash) VALUES (?, ?)",
                username, hash_pw
            )
        except Exception:
            return apology("username already exists", 400)

        # Log the new user in
        session["user_id"] = new_id

        # Redirect to home page (portfolio)
        return redirect("/")

    # Otherwise (GET), render the registration form
    return render_template("register.html")
