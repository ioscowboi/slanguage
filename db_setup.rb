# DATABASE.results_as_hash = true
#
# DATABASE.execute("CREATE TABLE IF NOT EXISTS cards
#                   (id INTEGER PRIMARY KEY,
#                   location TEXT, card_id INTEGER)")
#
#
# DATABASE.execute("CREATE TABLE IF NOT EXISTS answers
#                   (id INTEGER PRIMARY KEY,
#                   text TEXT,
#                   cards_id INTEGER,
#                   correct_answer INTEGER)")
#
#
# DATABASE.execute("CREATE TABLE IF NOT EXISTS players
#                   (id INTEGER PRIMARY KEY,
#                   name TEXT,
#                   age INTEGER,
#                   phone TEXT,
#                   email TEXT,
#                   username TEXT,
#                   password TEXT,
#                   correct_answers INTEGER)")
#
# DATABASE.execute("CREATE TABLE IF NOT EXISTS choices
#                   (player_id INTEGER PRIMARY KEY,
#                   answer_id INTEGER)")
#

# used to establish postgresql and rackup connections: 

unless ActiveRecord::Base.connection.table_exists?(:cards)
  ActiveRecord::Base.connection.create_table :cards do |t|
    t.text :location
    t.integer :card_id
  end 
end

unless ActiveRecord::Base.connection.table_exists?(:answers)
  ActiveRecord::Base.connection.create_table :answers do |t|
    t.text :text
    t.integer :cards_id
    t.integer :correct_answer
  end 
end

unless ActiveRecord::Base.connection.table_exists?(:players)
  ActiveRecord::Base.connection.create_table :players do |t|
    t.text :name
    t.integer :age
    t.text :phone
    t.text :email
    t.text :username
    t.text :password
    t.integer :correct_answers
  end 
end

unless ActiveRecord::Base.connection.table_exists?(:choices)
  ActiveRecord::Base.connection.create_table :choices do |t|
    t.integer :answer_id
    t.integer :player_id
  end 
end