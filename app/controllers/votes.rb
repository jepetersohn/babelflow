post '/questions/:id/votes' do
  if logged_in?
    @question = Question.find_by(id: params[:id])
    @question.votes.where(voter: current_user).destroy_all
    @vote = Vote.create(votable_type: "Question", votable_id: @question.id, voter_id: current_user.id, vote: params[:vote])
    if request.xhr?
      @question.votes.pluck(:vote).sum.to_s
    else
      redirect "/questions/#{@question.id}"
    end
  else
    if request.xhr?
      status 403
    else
      redirect "/"
    end
  end
end

post '/questions/:id/answers/:answer_id/votes' do
  if logged_in?
    @question = Question.find_by(id: params[:id])
    @answer = Answer.find_by(id: params[:answer_id])
    @answer.votes.where(voter: current_user).destroy_all
    @vote = Vote.create(votable_type: "Answer", votable_id: @answer.id, voter_id: current_user.id, vote: params[:vote])
    if request.xhr?
      @answer.votes.pluck(:vote).sum.to_s
    else
      redirect "/questions/#{@question.id}"
    end
  else
    if request.xhr?
      status 403
    else
      redirect "/"
    end
  end
end
