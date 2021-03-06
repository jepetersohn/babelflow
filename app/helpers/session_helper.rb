helpers do

  def logged_in?
    session[:user_id] != nil
  end

  def current_user
    @cached_user ||= User.find_by(id: session[:user_id]) if logged_in?
  end

  # def authenticate_logged_in
  #   redirect '/sessions/new' unless logged_in?
  # end

end
