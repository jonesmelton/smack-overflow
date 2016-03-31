

get "/users/new" do #User Registration Page

  erb :'/users/new'
end

get '/login' do
  erb :login
end

post '/login' do
  @errors = []
  current_user = User.authenticate(params[:credentials])
  if current_user
    session[:user_id] = current_user.id
    redirect '/'
  else
    @errors << "Credentials Invalid"
    erb :login
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

post "/users" do #Make new user

 @user = User.new(params[:credentials])

  if @user.save


  else
    @errors = @user.errors.full_messages

    redirect '/questions'
  end

end
