require 'sinatra'
require 'pry'
# Initialize and enable our program to run SQLITE3 : 
require 'sqlite3'

# Here, we create the actual database if it's not created yet.
# Otherwise, it will simply load the existing database: 
# ex: DATABASENAME = DATABASEINTERPRETERNAME::Databaseobjectname.new('yourdesired_database_name')

DATABASE = SQLite3::Database.new('slanguage.db')

require_relative 'db_setup.rb'
# Loading all erb and rb files so we they can talk to one another as needed: 

require_relative 'models/answer.rb'
require_relative 'Helper'

get "/" do
  erb :page1, :layout => :startpageboilerplate #find the erb file in views/welcome.erb and return it
end

get "/begin" do
  @id_picker = rand(1..1).to_i

  @right_choice = Answer.correct(@id_picker)
  @wrong_choices = Answer.bad_choice_generator(@id_picker)
  @all_choices = []
  @wrong_choices.each do |add_in| 
    @all_choices << add_in 
  end
  @right_choice.each do |add_in| 
    @all_choices << add_in 
  end
  @all_choices.shuffle!
  erb :start_game, :layout => :boilerplate #find the erb file in views/welcome.erb and return it
end

get "/next" do
  erb :next, :layout => :boilerplate #find the erb file in views/welcome.erb and return it
end