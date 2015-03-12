require 'sinatra'
require 'pry'
require 'rubygems'
# Initialize and enable our program to run SQLITE3 : 
require 'sqlite3'

require 'sinatra/activerecord'

# API implementation requires twilio-ruby
require 'twilio-ruby' 

# require 'rack-flash'

# Here, we create the actual database if it's not created yet.
# Otherwise, it will simply load the existing database: 
# ex: DATABASE = DATABASEINTERPRETERNAME::Databaseobjectname.new('yourdesired_database_name')

DATABASE = SQLite3::Database.new('slanguage.db')

# establish database connection: 
set :database, {adapter: "sqlite3", database: "slanguage.db"}
# Loading all erb and rb files so they can talk to one another as needed: 

require_relative 'db_setup.rb'
require_relative 'models/director.rb'
require_relative 'models/answer.rb'
require_relative 'models/card.rb'
require_relative 'models/player.rb'
require_relative 'helper.rb'
require_relative 'controllers/home.rb'
require_relative 'controllers/game.rb'
require_relative 'models/helper.rb'

enable :sessions