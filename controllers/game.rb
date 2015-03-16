# Initialize numbers to keep track of the state of the game
# random_number is an integer that defines: id's that can be chosen from, and size of test array.
# game_count integer is initialized to zero, but keeps track of the number of games won to determine state of the game.
# lost is the integer initialized to 0 and keeps count of the number of games lost.
# been_used array keeps track of the database id's that have been used.
# test_array is an array gathers all the possible id's for the game, and compares itself to the "been_used" array to see if
# game needs to be reset. This occurs if the player has cycled through all the possible choices before winner/loser is determined.

# Enabling sessions to track users login information
enable :sessions


random_number  = 10
game_count     = 0
lost           = 0
been_used      = []
test_array     = []

# create an array equal to the options id_picker can choose from
add_up         = 0

(1..random_number).each do 
  add_up      += 1
  test_array  << add_up
end

# session[:person]<< @person.id
# flash[:notice] = "Welcome!"

before "/begin" do
  if session[:id] == nil
    redirect ('/')
  end

end

get "/submit" do
  @user = params[:user]
  @pass = params[:password]
  @db_info = Player.where(username: @user)
  @db_info = @db_info[0]
  if @db_info == nil
    redirect ("/signup/#{@user}")
  end
  validate = Helper.new
  validate = validate.login(@user, @pass, @db_info)
  
  if validate == true
    session[:id]= @db_info.id
    session[:name]= @db_info.name
    redirect ("/welcome/#{@db_info.id}")
  else
    redirect ('/#loginScreeninvalid')
  end
end

get "/welcome/*" do
  @active_player = session[:name]
  @active_id     = session[:id]
  
  erb :page2, :layout => :startpageboilerplate
end

get "/signup/*" do
  session[:id]= nil
  @new_username = params[:splat]
  @new_username = @new_username[0]
  
  erb :signup
end

get "/enter" do
  @person = params[:user]
  @all_info = params
  params[:password] = BCrypt::Password.create(params["password"])
  profile = Player.create(name: params[:name], password: params[:password], username: params[:user], age: params[:age], email: params[:email], phone: params[:phone]) 
  session[:id] = profile.id
  session[:name]= profile.name
  redirect ("/welcome/#{@person}")
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
# redirects to /winner if the answer was correct
# redirects to /game_over if 3 incorrect answers during a game
# redirects to /try_again if the answer was incorrect, but there are less than 3 incorrect answers
get "/validate" do
  @their_answer = params["answer"]
  if @their_answer.to_i == 1
    game_count += 1
    if game_count >= 5
      redirect "/winner"
    end
    redirect "/correct"
  else
    lost      += 1
    
    if lost   >= 3
      redirect "/game_over"
    end
    
    redirect "/try_again"
  end

end

# runs if there are less than 5 correct answers and the most recent answer was correct
get "/correct" do
  
  erb :correct, :layout => :delay_boiler
end

# runs this route if incorrect answer was given and there are less than 3 incorrect answers during a game
get "/try_again" do
  
  erb :try_again, :layout => :delay_boiler
end

# runs if the player has answered 5 choices correctly
get "/winner" do
  @winner = session[:name]
  #reset variables to zero
  game_count   = 0
  been_used    = []
  lost         = 0
  #sends text message to the winner!
  text_message = Helper.new
  text_message.winner(@winner)
  
  erb :winner, :layout => :winner_boiler
end

# runs if the player has refreshed the page a number of times that the game has run out of new challenges to display
get "/play-again" do
  #reset variables to zero
  lost         = 0
  game_count   = 0
  been_used    = []
  
  erb :start_over, :layout => :restart_boiler
end

# runs if the player has submitted 3 incorrect choices 
get "/game_over" do
  #reset variables to zero
  lost         = 0
  game_count   = 0
  been_used    = []
  @not_winner  = session[:name]
  #sends text message to encourage the player to try again
  text_message = Helper.new
  text_message.game_over(@not_winner)

  erb :game_over, :layout => :game_over_boiler
end

# runs if the timer has expired for any round. This resets the game.

get "/times_up" do
  #reset variables to zero
  lost        = 0
  game_count  = 0
  been_used   = []
  
  erb :times_up, :layout => :game_over_boiler
end

get "/test" do
  
  erb :test, :layout => :boilerplate
end

get "/sign_out" do
  @username = session[:name]
  @user_id   = session[:id]
  @logout_validator = session[:id]
  session[:name]= nil
  session[:id]= nil

  erb :signed_out, :layout => :game_over_boiler
end