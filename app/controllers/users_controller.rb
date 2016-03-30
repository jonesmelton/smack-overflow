
get "/users/new" do #User Registration Page

  erb :'/users/new'
end


post "/users" do #Make new user

 @user = User.new(params[:credentials])

  if @user.save


  else
    @errors = @user.errors.full_messages

    erb :'/users/new'
  end

end
