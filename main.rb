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
game_count = 0
lost = 0
been_used = []

get "/" do
  erb :page1, :layout => :startpageboilerplate #find the erb file in views/welcome.erb and return it
end

get "/begin" do
  if game_count == 5
    redirect to ("/winner")
  end
  @id_picker = rand(1..random_number).to_i
  while been_used.include? @id_picker
    @id_picker = rand(1..random_number).to_i
  end
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

get "/validate" do
  @their_answer = params["answer"]
  
  if @their_answer.to_i == 1
    game_count += 1
    if game_count >= 5
      redirect to ("/winner")
    end
    redirect to ("/correct")
  else
    lost += 1
    if lost >= 3
      redirect to ("/game_over")
    end
    redirect to ("/try_again")
  end
  
  erb :layout => :delay_boiler
end

get "/correct" do
  erb :correct, :layout => :delay_boiler
end

get "/try_again" do
  erb :try_again, :layout => :delay_boiler
end

get "/winner" do
  game_count = 0
  been_used = []
  lost = 0
erb :winner, :layout => :winner_boiler
end

get "/game_over" do
  lost = 0
  game_count = 0
  been_used = []
  
erb :game_over, :layout => :game_over_boiler
end

get "/times_up" do
  lost = 0
  game_count = 0
  been_used = []
  
erb :times_up, :layout => :game_over_boiler
end