# get '/sessions' do
#   #display a list of all sessions
# end
get '/sessions/new' do
  erb :'sessions/new'
end
post '/sessions' do
  #create a new sessions
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
