post '/questions/:id/votes' do
  @question = Question.find_by(id: params[:id])
  if request.xhr?
    @vote = Vote.create(votable_type: "Question", votable_id: @question.id, voter_id: current_user.id, vote: params[:vote])
    @question.votes.pluck(:vote).sum.to_s
  else
    @vote = Vote.create(votable_type: "Question", votable_id: @question.id, voter_id: current_user.id, vote: params[:vote].to_i)
    redirect "/questions/#{@question.id}"
  end

end

post '/questions/:id/answers/:answer_id/votes' do
  @question = Question.find_by(id: params[:id])
  @answer = Answer.find_by(id: params[:answer_id])
  if request.xhr?
    @vote = Vote.create(votable_type: "Answer", votable_id: @answer.id, voter_id: current_user.id, vote: params[:vote])
    @answer.votes.pluck(:vote).sum.to_s
  else
    @vote = Vote.create(votable_type: "Answer", votable_id: @answer.id, voter_id: current_user.id, vote: params[:vote].to_i)
    redirect "/questions/#{@question.id}"
  end

end