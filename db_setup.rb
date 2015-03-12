DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS cards 
                  (id INTEGER PRIMARY KEY,
                  location TEXT, card_id INTEGER)")


DATABASE.execute("CREATE TABLE IF NOT EXISTS answers 
                  (id INTEGER PRIMARY KEY,
                  text TEXT, 
                  cards_id INTEGER,
                  correct_answer INTEGER)")
                  

DATABASE.execute("CREATE TABLE IF NOT EXISTS players 
                  (id INTEGER PRIMARY KEY,
                  name TEXT, 
                  age INTEGER,
                  phone TEXT,
                  email TEXT,
                  username TEXT,
                  password TEXT,
                  correct_answers INTEGER)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS choices 
                  (player_id INTEGER PRIMARY KEY,
                  answer_id INTEGER)")
                  
                  
                