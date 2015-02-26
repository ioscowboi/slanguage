random_number  = 10
game_count     = 0
lost           = 0
been_used      = []
restart_tester = 1
test_array     = []

# create an array equal to the options id_picker can choose from
add_up         = 0

(1..random_number).each do 
  add_up += 1
  test_array << add_up
end


# this route handler runs the game 
get "/begin" do
  max_shuffler = rand(1..100).to_i
  
  if game_count == 5
    redirect ("/winner")
  end
  @id_picker = rand(1..random_number).to_i
  while been_used.include? @id_picker
    if been_used == []
      # get out of the loop!
      
      #for this elsif, order matters. test_array has all the possible values for this query.
      #all the values from the test_array must be gone for the array to be empty
      #doing the test with been_used first won't work, it will always return true in that manner. 
    elsif (test_array - been_used).empty? && been_used != []
      redirect "/play-again"
    else
      @id_picker = rand(1..random_number).to_i
    end
  end
  
  been_used << @id_picker

  @image_picker   = Card.grab_card(@id_picker)
  @right_choice   = Answer.correct(@id_picker)
  @wrong_choices  = Answer.bad_choice_generator(@id_picker)
  @all_choices    = []
  @wrong_choices.each do |add_in| 
    @all_choices << add_in 
  end
  @right_choice.each do |add_in| 
    @all_choices << add_in 
  end
  
  max_shuffler.times { @all_choices.shuffle! }
  erb :start_game, :layout => :boilerplate #find the erb file in views/welcome.erb and return it

end

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