get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  #not needed if we AJAX this shit
end

post '/questions' do
  if logged_in?
    @author = current_user
    @question = Question.new(params[:question])
    @question.author = author
    if @question.save #request.xhr?
      redirect "/questions/#{@question.id}"
    else
      status 500
    end
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

post '/questions/:id/answers' do
  if logged_in?
    @responder = User.find_by(id: session[:user_id])
    if Question.find_by(id: params[:id]).author == @responder
      status 403
    else
      answer = Answer.new(question_id: params[:id],
                          responder: @responder,
                          body: params[:body])
      if answer.save
        redirect "/questions/#{params[:id]}"
      else
        status 500
      end
    end
  else
    status 403
  end
end
