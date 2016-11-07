get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end


get '/questions/new' do
  #not needed if we AJAX this shit
end

post '/questions' do
  if logged_in?
    @question = Question.new(params[:question])
    @question.author_id = current_user.id
    if request.xhr?
      if @question.save
        erb :'questions/_questions', layout: false, locals: {question: @question}
      else
        status 500
      end
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

put '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  if logged_in?
    if current_user == @question.author
      @question.best_answer_id = params[:best_answer]
      if @question.save
        redirect "/questions/#{params[:id]}"
      else
        @message = "An error occurred."
        redirect "/questions/#{params[:id]}"
      end
    end
  else
    status 403
  end
end
