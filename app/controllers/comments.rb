post '/comments' do
  if logged_in?
    puts params[:comment]
    @comment = Comment.new(params[:comment])
    puts current_user.id
    @comment.assign_attributes(author_id: current_user.id)
    if request.xhr?
      if @comment.save
        erb :'comments/comment', layout: false, locals: {comment: @comment}
      else
        status 500
      end
    end
  else
    status 403
  end
end
