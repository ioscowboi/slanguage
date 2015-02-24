random_number = 10
game_count = 0
lost = 0
been_used = []

get "/begin" do
  if game_count == 5
    redirect to ("/winner")
  end
  @id_picker = rand(1..random_number).to_i
  been_used << @id_picker
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
  
  # put your own credentials here 
  account_sid = 'ACee9f6a906bf3ecb52564efffcbf90418' 
  auth_token = '04b586abce34e49a7fed2e1162a6ffd2' 
 
  # set up a client to talk to the Twilio REST API 
  @client = Twilio::REST::Client.new account_sid, auth_token 
 
  @client.account.messages.create({
  	:from => '+14026206953', 
  	:to => '4028811036', 
  	:body => 'You did it! You won the game! -Slanguage',  
  })
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