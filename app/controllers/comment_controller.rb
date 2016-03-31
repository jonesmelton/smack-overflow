 post '/comments/:comment_id/votes' do
  @comment = Comment.find(params[:comment_id])
  if request.xhr?
      @comment.place_vote(params[:stuff], current_user)
      content_type :json
      {score: @comment.score}.to_json
  else
    if @comment.place_vote(params[:vote_type], current_user)
      redirect "/questions/#{@comment.commentable.question.id}"
    else
      puts "something fucked up"
      redirect "/questions/#{@comment.commentable.question.id}"
    end
  end

end

