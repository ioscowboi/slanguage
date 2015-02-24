require 'sinatra'
require 'pry'
require 'rubygems'
# Initialize and enable our program to run SQLITE3 : 
require 'sqlite3'

# API implementation requires twilio-ruby
require 'twilio-ruby' 

# Here, we create the actual database if it's not created yet.
# Otherwise, it will simply load the existing database: 
# ex: DATABASE = DATABASEINTERPRETERNAME::Databaseobjectname.new('yourdesired_database_name')

DATABASE = SQLite3::Database.new('slanguage.db')

require_relative 'db_setup.rb'
# Loading all erb and rb files so they can talk to one another as needed: 

require_relative 'models/answer.rb'
require_relative 'models/card.rb'
require_relative 'Helper'
require_relative 'controllers/home.rb'
require_relative 'controllers/game.rb'

