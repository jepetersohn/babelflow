post '/questions/:id/comments' do
  if logged_in?
    @comment = Comment.new(user_id: current_user.id, commentable_id: params[:id], commentable_type: "Question", body: params[:comment] )
    if @comment.save
      redirect "/questions/#{params[:id]}"
    end
  else
    "Sorry, you may not comment without first logging in."
  end
end