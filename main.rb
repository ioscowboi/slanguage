require 'sinatra'
require 'pry'
# Initialize and enable our program to run SQLITE3 : 
require 'sqlite3'

# Here, we create the actual database if it's not created yet.
# Otherwise, it will simply load the existing database: 
# ex: DATABASE = DATABASEINTERPRETERNAME::Databaseobjectname.new('yourdesired_database_name')

DATABASE = SQLite3::Database.new('slanguage.db')

require_relative 'db_setup.rb'
# Loading all erb and rb files so they can talk to one another as needed: 

require_relative 'models/answer.rb'
require_relative 'models/card.rb'
require_relative 'Helper'


random_number = 10
get "/" do
  erb :page1, :layout => :startpageboilerplate #find the erb file in views/welcome.erb and return it
end


get "/begin" do
  @id_picker = rand(1..random_number).to_i
  @image_picker = Card.grab_card(@id_picker)
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

get "/correct" do
  erb :correct, :layout => :boilerplate
end

get "/try_again" do
  erb :try_again, :layout => :boilerplate
end


after "/begin" do
  @their_answer = params["answer"]
  if @right_choice.detect{:id}.id == @their_answer
    redirect to ("/correct")
  elsif @right_choice.detect{:id}.id != @their_answer
    redirect to ("/try_again")
  else
  end
end
