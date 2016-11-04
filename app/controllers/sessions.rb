# get '/sessions' do
#   #display a list of all sessions
# end
get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:user][:email])
  if @user
    if @user.authenticate(params[:user])
      session[:user_id] = @user.id
      redirect "/questions"
    else
      @message = "Invalid password"
      erb :'sessions/new'
    end
  else
    @message = "Invalid username"
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
delete '/sessions' do
  if request.xhr?
    session[:user_id] = nil
  else
    session.delete(:user_id)
    redirect '/'
  end
end
