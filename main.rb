require 'sinatra' 
require 'pry'
require 'rubygems'

configure :development do
  # Initialize and enable our program to run SQLITE3 : 
  require 'sqlite3'
end

require 'bcrypt'

require 'sinatra/activerecord'

# API implementation requires twilio-ruby
require 'twilio-ruby' 
#

# Here, we create the actual database if it's not created yet.
# Otherwise, it will simply load the existing database: 
# ex: DATABASE = DATABASEINTERPRETERNAME::Databaseobjectname.new('yourdesired_database_name')

# DATABASE = SQLite3::Database.new('slanguage.db')

configure :production do
  db = URI.parse(ENV['DATABASE_URL'])
  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
)
end

configure :development do
  set :database, {adapter: "sqlite3", database: "slanguage.db"}
end

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

