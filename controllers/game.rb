# Initialize numbers to keep track of the state of the game
# random_number is an integer that defines: id's that can be chosen from, and size of test array.
# game_count integer is initialized to zero, but keeps track of the number of games won to determine state of the game.
# lost is the integer initialized to 0 and keeps count of the number of games lost.
# been_used array keeps track of the database id's that have been used.
# test_array is an array gathers all the possible id's for the game, and compares itself to the "been_used" array to see if
# game needs to be reset. This occurs if the player has cycled through all the possible choices before winner/loser is determined.
random_number  = 10
game_count     = 0
lost           = 0
been_used      = []
test_array     = []

# create an array equal to the options id_picker can choose from
add_up         = 0

(1..random_number).each do 
  add_up += 1
  test_array << add_up
end


# this route handler runs the game : [generates images, and matches them to the possible answers during each round]
get "/begin" do
  #max_shuffler is the random number of times (renewed after each round of play) that the 4 answers will be shuffled
  #see further below for how this works:
  max_shuffler = rand(1..100).to_i
  
  #this test checks to see if there is a winner after each round
  if game_count == 5
    redirect ("/winner")
  end
  
  # generate a random id for each round 
  @id_picker = rand(1..random_number).to_i
  
  # tests to see if the integer value of @id_picker has already been displayed to the player
  # if true, this loop generates a new random id integer. 
  while been_used.include? @id_picker
    
    # get out of the loop if the been_used array is empty:
    if been_used == []
      
    #kick player out of game is all possible id's have been used (no cheating!):
    #note: for this 'elsif', order matters. test_array has all the possible values for this query.
    #all the values from the test_array must be gone for the array to be empty
    #doing the test with been_used first won't work, it will always return true in that manner. 
    elsif (test_array - been_used).empty? && been_used != []
      redirect "/play-again"
      
    #otherwise, go ahea and generate a random id integer to create the next round for the player:
    else
      @id_picker = rand(1..random_number).to_i
    end
  end
  
  #then, add the id integer to the "been_used" array so that the next round knows what id's have been played.
  been_used << @id_picker

# grab the following: image location from the database, one(only one) correct choice, and 3 incorrect choices
  @image_picker   = Card.grab_card(@id_picker)
  @right_choice   = Answer.correct(@id_picker)
  @wrong_choices  = Answer.bad_choice_generator(@id_picker)
  
  @all_choices    = []
  
  #combine all correct and incorrect choices (total = 4 choices) together and then scramble them a random number of times 
  #such that the correct answer is not always in the same position after each round:
  @wrong_choices.each do |add_in| 
    @all_choices << add_in 
  end
  @right_choice.each do |add_in| 
    @all_choices << add_in 
  end
  
  max_shuffler.times { @all_choices.shuffle! }
  erb :start_game, :layout => :boilerplate #find the erb file in views/welcome.erb and return it

end

# validates the answer chosen by the player and redirects to the appropriate route handler:
get "/validate" do
  @their_answer = params["answer"]
  if @their_answer.to_i == 1
    game_count += 1
    if game_count >= 5
      redirect "/winner"
    end
    redirect "/correct"
  else
    lost += 1
    if lost >= 3
      redirect "/game_over"
    end
    redirect "/try_again"
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
  #reset variables to zero
  game_count   = 0
  been_used    = []
  lost         = 0
  
  text_message = Helper.new
  text_message.winner
  
  erb :winner, :layout => :winner_boiler
end

get "/play-again" do
  #reset variables to zero
  lost         = 0
  game_count   = 0
  been_used    = []
erb :start_over, :layout => :restart_boiler
end

get "/game_over" do
  #reset variables to zero
  lost         = 0
  game_count   = 0
  been_used    = []
  
  text_message = Helper.new
  text_message.game_over

  erb :game_over, :layout => :game_over_boiler
end

get "/times_up" do
  #reset variables to zero
  lost        = 0
  game_count  = 0
  been_used   = []
  
erb :times_up, :layout => :game_over_boiler
end