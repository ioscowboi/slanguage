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

  def winner(their_name, their_number)
    # put your own credentials here 
    account_sid = 'ACee9f6a906bf3ecb52564efffcbf90418' 
    auth_token = '04b586abce34e49a7fed2e1162a6ffd2' 
    name = their_name
    num  = their_number
    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
 
    @client.account.messages.create({
    	:from => '+14026206953', 
    	:to => "#{num}", 
    	:body => "You did it\, #{name}! You won the game! -Slanguage",  
    })
  end
  
  def login(*splat)
    user_name = splat[0]
    password_entered_by_user = splat[1]
    db_userName = splat[2].username
    db_password = splat[2].password
    valid = ''
    valid_password = ''
    
    if BCrypt::Password.new(db_password) == password_entered_by_user
      valid_password = true
    end

    if user_name == db_userName && valid_password == true
      valid = true
    else
      valid = false
    end
    valid
  end
  
  def game_over(their_name, their_number)
    # put your own credentials here 
    account_sid  = 'ACee9f6a906bf3ecb52564efffcbf90418' 
    auth_token   = '04b586abce34e49a7fed2e1162a6ffd2' 
    name = their_name
    num  = their_number
    # set up a client to talk to the Twilio REST API 
    @client      = Twilio::REST::Client.new account_sid, auth_token 
 
    @client.account.messages.create({
    	:from => '+14026206953', 
    	:to => "#{num}", 
    	:body => "You were so close\, #{name}! Come back and play again. -Slanguage",  
    })
  end

end