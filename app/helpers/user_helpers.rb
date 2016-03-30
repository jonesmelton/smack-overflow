helpers do
  def logged_in?
    session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end

  def owner?(object)
    object.user_id == current_user.id
  end

end
