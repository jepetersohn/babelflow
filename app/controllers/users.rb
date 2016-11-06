# get '/users' do
#   #display a list of all users
# end
get '/users/new' do
  #registration
  erb :"users/new"
end

post '/users' do
  @user = User.create(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/questions"
  else
    @errors = @user.errors
    erb :"users/new"
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :"users/show"
end
# get '/users/:id/edit' do
#   #return an HTML form for editing users
# end
# put '/users/:id' do
#   # update a specific users
# end
# delete '/users/:id' do
#   #delete a specific users
# end
