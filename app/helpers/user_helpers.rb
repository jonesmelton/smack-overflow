helpers do
  def logged_in?
    session[:user_id]
  end

  def current_user
    # this will blow up if user is not logged in
    User.find_by(id: session[:user_id])
  end

  def owner?(object)
    object.user_id == current_user.id
  end

  def authorize!
    # don't depend on the truthiness of this method
    redirect "/login" unless logged_in?
  end

end
