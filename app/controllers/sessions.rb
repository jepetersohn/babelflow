# get '/sessions' do
#   #display a list of all sessions
# end
get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:user][:email])
  if @user && User.authenticate(params[:user])
    session[:user_id] = @user.id
    redirect "/questions"
  else
    @message = "Invalid username or password"
    erb :'sessions/new'
  end
end
get '/sessions/:id' do
  #display a specific article sessions
end
get '/sessions/:id/edit' do
  #return an HTML form for editing sessions
end
put '/sessions/:id' do
  # update a specific sessions
end
delete '/sessions/:id' do
  #delete a specific sessions
end
