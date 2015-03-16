enable :sessions
get "/" do
  @logged_in = session[:id]
  @name      = session[:name]
  erb :page1, :layout => :startpageboilerplate #find the erb file in views/welcome.erb and return it
end