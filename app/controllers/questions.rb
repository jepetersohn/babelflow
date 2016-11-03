get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  #not needed if we AJAX this shit
end

post '/questions' do
  if session[:user_id]
    ":)"
  else
    status 403
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  if @question
    erb :'questions/show'
  else
    status 404
  end
end

get '/questions/:id/edit' do
  # check cookie!
end

put '/questions/:id' do
  # check cookie!
end

delete '/questions/:id' do
  #check cookie!
end
