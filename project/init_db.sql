-- Users table (corrected)
CREATE TABLE IF NOT EXISTS users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  hash TEXT NOT NULL
);

-- Movies table
CREATE TABLE IF NOT EXISTS movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  mood TEXT NOT NULL,
  poster_url TEXT,
  description TEXT,
  imdb_url TEXT
);

-- History table
CREATE TABLE IF NOT EXISTS history (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL REFERENCES users(id),
  movie_id INTEGER NOT NULL REFERENCES movies(id),
  when_searched DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Example seed data for movies table
INSERT INTO movies (title, mood, poster_url, description, imdb_url) VALUES
-- Happy
('The Pursuit of Happyness', 'happy', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/lBYOKAMcxIvuk9s9hMuecB9dPBV.jpg', 'A struggling salesman takes custody of his son as he is poised to begin a life-changing professional career.', 'https://www.imdb.com/title/tt0454921/'),
('Inside Out', 'happy', 'https://resizing.flixster.com/9yBTi5Q-FOV9lXW6UfJ-K3IZbd4=/206x305/v2/https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p10840532_p_v13_al.jpg', 'After young Riley is uprooted from her Midwest life, her emotions conflict on how best to navigate a new city.', 'https://www.imdb.com/title/tt2096673/'),
('Amelie', 'happy', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/oTKduWL2tpIKEmkAqF4mFEAWAsv.jpg', 'Amelie is an innocent and naive girl in Paris with her own sense of justice.', 'https://www.imdb.com/title/tt0211915/'),
('Paddington 2', 'happy', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/1OJ9vkD5xPt3skC6KguyXAgagRZ.jpg', 'Paddington, now happily settled with the Brown family, picks up a series of odd jobs to buy the perfect present for his Aunt Lucy.', 'https://www.imdb.com/title/tt4468740/'),
('The Intouchables', 'happy', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/1QU7HKgsQbGpzsJbJK4pAVQV9F5.jpg', 'After he becomes a quadriplegic from a paragliding accident, an aristocrat hires a young man from the projects to be his caregiver.', 'https://www.imdb.com/title/tt1675434/'),
('Singin'' in the Rain', 'happy', 'https://image.tmdb.org/t/p/w500/6QMSLvU5ziIL2T6VrkaKzN2YkxK.jpg', 'A silent film production company and cast make a difficult transition to sound.', 'https://www.imdb.com/title/tt0045152/'),
('Up', 'happy', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/mFvoEwSfLqbcWwFsDjQebn9bzFe.jpg', '78-year-old Carl sets out to fulfill his lifelong dream to see the wilds of South America.', 'https://www.imdb.com/title/tt1049413/'),
('Forrest Gump', 'happy', 'https://image.tmdb.org/t/p/w500/saHP97rTPS5eLmrLQEcANmKrsFl.jpg', 'The presidencies of Kennedy and Johnson, the Vietnam War, and more, through the eyes of an Alabama man.', 'https://www.imdb.com/title/tt0109830/'),
('The Grand Budapest Hotel', 'happy', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/eWdyYQreja6JGCzqHWXpWHDrrPo.jpg', 'A writer encounters the owner of an aging high-class hotel, who tells him of his early years serving as a lobby boy.', 'https://www.imdb.com/title/tt2278388/'),
('La La Land', 'happy', 'https://image.tmdb.org/t/p/w500/uDO8zWDhfWwoFdKS4fzkUJt0Rf0.jpg', 'While navigating their careers in Los Angeles, a pianist and an actress fall in love.', 'https://www.imdb.com/title/tt3783958/'),

-- Nostalgic
('The Shawshank Redemption', 'nostalgic', 'https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 'https://www.imdb.com/title/tt0111161/'),
('Stand by Me', 'nostalgic', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/vz0w9BSehcqjDcJOjRaCk7fgJe7.jpg', 'After the death of a friend, four boys journey to find the body of a missing boy.', 'https://www.imdb.com/title/tt0092005/'),
('Back to the Future', 'nostalgic', 'https://image.tmdb.org/t/p/w500/fNOH9f1aA7XRTzl1sAOx9iF553Q.jpg', 'Marty McFly, a 17-year-old high school student, is accidentally sent 30 years into the past.', 'https://www.imdb.com/title/tt0088763/'),
('The Sandlot', 'nostalgic', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/7PYqz0viEuW8qTvuGinUMjDWMnj.jpg', 'In the summer of 1962, a new kid in town is taken under the wing of a young baseball prodigy.', 'https://www.imdb.com/title/tt0108037/'),
('Aladdin', 'nostalgic', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/eLFfl7vS8dkeG1hKp5mwbm37V83.jpg', 'A kind-hearted street urchin and a power-hungry Grand Vizier vie for a magic lamp that has the power to make their deepest wishes come true.', 'https://www.imdb.com/title/tt0103639/'),
('2 Fast 2 Furious', 'nostalgic', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/6nDZExrDKIXvSAghsFKVFRVJuSf.jpg', 'Former cop Brian O''Conner teams up with an ex-con to transport a shipment of dirty money for a shady Miami-based importer-exporter, all while working undercover to bring him down.', 'https://www.imdb.com/title/tt0322259/'),
('The Princess Bride', 'nostalgic', 'https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg', 'While home sick in bed, a young boy''s grandfather reads him a story.', 'https://www.imdb.com/title/tt0093779/'),
('E.T. the Extra-Terrestrial', 'nostalgic', 'https://image.tmdb.org/t/p/w500/an0nD6uq6byfxXCfk6lQBzdL2J1.jpg', 'A troubled child summons the courage to help a friendly alien escape Earth.', 'https://www.imdb.com/title/tt0083866/'),
('The Goonies', 'nostalgic', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/eBU7gCjTCj9n2LTxvCSIXXOvHkD.jpg', 'A group of young misfits set out to find a pirate''s ancient treasure.', 'https://www.imdb.com/title/tt0089218/'),
('Furious 7', 'nostalgic', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/wurKlC3VKUgcfsn0K51MJYEleS2.jpg', 'Deckard Shaw seeks revenge against Dominic Toretto and his family for his comatose brother.', 'https://www.imdb.com/title/tt2820852/'),

-- Adventurous
('Mad Max: Fury Road', 'adventurous', 'https://image.tmdb.org/t/p/w500/8tZYtuWezp8JbcsvHYO0O46tFbo.jpg', 'In a post-apocalyptic wasteland, Max teams up with a mysterious woman to flee from a cult leader.', 'https://www.imdb.com/title/tt1392190/'),
('Indiana Jones and the Raiders of the Lost Ark', 'adventurous', 'https://image.tmdb.org/t/p/w500/ceG9VzoRAVGwivFU403Wc3AHRys.jpg', 'In 1936, archaeologist Indiana Jones is hired to find the Ark of the Covenant.', 'https://www.imdb.com/title/tt0082971/'),
('Jurassic Park', 'adventurous', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/fjTU1Bgh3KJu4aatZil3sofR2zC.jpg', 'During a preview tour, a theme park suffers a major power breakdown that allows its cloned dinosaur exhibits to run amok.', 'https://www.imdb.com/title/tt0107290/'),
('The Lord of the Rings: The Fellowship of the Ring', 'adventurous', 'https://image.tmdb.org/t/p/w500/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg', 'A meek Hobbit and eight companions set out on a journey to destroy the One Ring.', 'https://www.imdb.com/title/tt0120737/'),
('Pirates of the Caribbean: The Curse of the Black Pearl', 'adventurous', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/z8onk7LV9Mmw6zKz4hT6pzzvmvl.jpg', 'Blacksmith Will Turner teams up with eccentric pirate Jack Sparrow to save his love.', 'https://www.imdb.com/title/tt0325980/'),
('Star Wars: Episode IV - A New Hope', 'adventurous', 'https://image.tmdb.org/t/p/w500/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg', 'Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy.', 'https://www.imdb.com/title/tt0076759/'),
('Spider-Man: No Way Home', 'adventurous', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg', 'Peter Parker seeks help from Doctor Strange to restore his secret identity, but when the spell goes wrong, villains from other universes are unleashed, forcing Spider-Man to confront his greatest challenges yet.', 'https://www.imdb.com/title/tt10872600/'),
('Guardians of the Galaxy', 'adventurous', 'https://image.tmdb.org/t/p/w500/r7vmZjiyZw9rpJMQJdXpjgiCOk9.jpg', 'A group of intergalactic criminals must pull together to stop a fanatical warrior.', 'https://www.imdb.com/title/tt2015381/'),
('Inception', 'adventurous', 'https://image.tmdb.org/t/p/w500/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg', 'A thief who steals corporate secrets through dream-sharing technology is given the inverse task of planting an idea.', 'https://www.imdb.com/title/tt1375666/'),
('Teenage Mutant Ninja Turtles', 'adventurous', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/azL2ThbJMIkts3ZMt3j1YgBUeDB.jpg', 'Four mutant turtle brothers trained in ninjitsu emerge from the sewers to protect New York City from criminals and evil masterminds, facing their greatest threat yet.', 'https://www.imdb.com/title/tt1291150/'),

-- Sad
('To a Land Unknown', 'sad', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/4CJmere0yJDpEUjDkHjFwdi3gtU.jpg', 'A Palestinian man and his nephew, both refugees in Egypt, embark on a perilous journey to Europe in search of a better life.', 'https://www.imdb.com/title/tt22023622/'),
('Schindler''s List', 'sad', 'https://image.tmdb.org/t/p/w500/c8Ass7acuOe4za6DhSattE359gr.jpg', 'In German-occupied Poland during World War II, Oskar Schindler gradually becomes concerned for his Jewish workforce.', 'https://www.imdb.com/title/tt0108052/'),
('Grave of the Fireflies', 'sad', 'https://image.tmdb.org/t/p/w500/qG3RYlIVpTYclR9TYIsy8p7m7AT.jpg', 'A young boy and his little sister struggle to survive in Japan during World War II.', 'https://www.imdb.com/title/tt0095327/'),
('The Florida Project', 'sad', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/eE1J6nCMw8UhsAOI6HhhItarWmN.jpg', 'Set on the outskirts of Orlando, a precocious six-year-old and her friends make the most of their summer while living in a budget motel under the care of her rebellious mother, as they navigate childhood innocence amid difficult circumstances.', 'https://www.imdb.com/title/tt5649144/'),
('The Amazing Spider-Man 2', 'sad', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/dGjoPttcbKR5VWg1jQuNFB247KL.jpg', 'Peter Parker struggles to balance his life as Spider-Man and his relationship with Gwen Stacy, while facing new enemies and heartbreaking loss.', 'https://www.imdb.com/title/tt1872181/'),
('City Lights', 'sad', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/ugmakEL5y294I5bXgiBqApuZpwc.jpg', 'Charlie Chaplin stars as the Tramp, who falls in love with a blind flower girl and develops a friendship with a wealthy man, doing everything he can to help her regain her sight.', 'https://www.imdb.com/title/tt0021749/'),
('Bridge to Terabithia', 'sad', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/3xFxGodKPMFLheS8rujFSmLfcq4.jpg', 'A preteen boy befriends the new girl at school, and together they create a magical kingdom in the woods that helps them escape from the struggles of real life.', 'https://www.imdb.com/title/tt0398808/'),
('Alice in Wonderland', 'sad', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/o0kre9wRCZz3jjSjaru7QU0UtFz.jpg', 'A young woman named Alice returns to the whimsical world of Wonderland, where she reunites with her childhood friends and embarks on a quest to end the Red Queens reign of terror.', 'https://www.imdb.com/title/tt1014759/'),
('Hachi: A Dog''s Tale', 'sad', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/lsy3aEsEfYIHdLRk4dontZ4s85h.jpg', 'A college professor bonds with an abandoned dog he takes into his home.', 'https://www.imdb.com/title/tt1028532/'),
('Titanic', 'sad', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg', 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.', 'https://www.imdb.com/title/tt0120338/');
