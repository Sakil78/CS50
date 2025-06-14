<!-- PROJECT BADGES -->
<p align="center">
  <img src="https://img.shields.io/badge/Flask-v2.2.5-informational?logo=flask&logoColor=white" alt="Flask">
  <img src="https://img.shields.io/badge/SQLite-3.39.4-informational?logo=sqlite&logoColor=white" alt="SQLite">
  <img src="https://img.shields.io/badge/Bootstrap-5.3.3-informational?logo=bootstrap&logoColor=white" alt="Bootstrap">
  <img src="https://img.shields.io/badge/License-MIT-green" alt="MIT License">
</p>

# Mood-Based Movie Recommender - CS50 Final Project

A web application where users can register, log in, pick their mood, and get movie recommendations. Each recommendation is saved to their history. Built with Flask, SQLite, Bootstrap, and CS50's SQL library.

## Features

- User registration and login
- Mood picker (happy, sad, adventurous, nostalgic)
- Movie recommendations with poster, description, and IMDb link
- History of past recommendations
- Modern, responsive UI with Bootstrap
- Movie-themed favicon and visuals

## Setup

1. **Clone this repository**
   ```powershell
   git clone <your-repo-url>
   cd <project-folder>
   ```
2. **(Optional) Create and activate a virtual environment**
   ```powershell
   python -m venv venv
   .\venv\Scripts\Activate
   ```
3. **Install dependencies**
   ```powershell
   pip install -r requirements.txt
   ```
4. **Initialize the database**
   ```powershell
   sqlite3 movies.db < init_db.sql
   ```
5. **Run the application**
   ```powershell
   $env:FLASK_APP = "app.py"
   $env:FLASK_ENV = "development"
   flask run
   ```
   Then open http://127.0.0.1:5000 in your browser.

## Database Schema
See `init_db.sql` for table definitions and seed data.

## File Structure
- `app.py` — Main Flask app
- `helpers.py` — Helper functions
- `init_db.sql` — Database schema and seed data
- `requirements.txt` — Python dependencies
- `static/` — CSS, favicon, and static assets
- `templates/` — HTML templates

## Credits
- Movie posters from TMDb or Flixster
- IMDb for movie links
- Unsplash for homepage images

## Academic Honesty
If you use AI tools, cite them in your code comments as required by CS50 policy.

🛡️ License
Distributed under the MIT License.
