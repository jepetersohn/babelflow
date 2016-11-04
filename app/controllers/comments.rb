post '/comments' do
  if logged_in?
    @comment = Comment.new(params[:comment])
    @comment.author_id = current_user.id
    if request.xhr?
      status 204
      if @comment.save
        erb :'comments/comment'
      else
        status 500
      end
    end
  else
    status 403
  end
end
