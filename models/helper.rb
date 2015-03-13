class Helper
  # include BCrypt
  #
  # def password
  #   @password ||= Password.new(password_hash)
  # end
  #
  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end

  def winner
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
  end
  
  def login(*splat)
    user_name = splat[0]
    password = splat[1]
    db_userName = splat[2].username
    db_password = splat[2].password
    valid = ''
    if user_name == db_userName && password == db_password
      valid = true
    else
      valid = false
    end
    valid
  end
  
  def game_over
    # put your own credentials here 
    account_sid  = 'ACee9f6a906bf3ecb52564efffcbf90418' 
    auth_token   = '04b586abce34e49a7fed2e1162a6ffd2' 
 
    # set up a client to talk to the Twilio REST API 
    @client      = Twilio::REST::Client.new account_sid, auth_token 
 
    @client.account.messages.create({
    	:from => '+14026206953', 
    	:to => '4028811036', 
    	:body => 'You were so close! Come back and play again. -Slanguage',  
    })
  end

end