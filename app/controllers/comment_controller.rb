 post '/comments/:comment_id/votes' do
  authorize!
  @comment = Comment.find(params[:comment_id])
  if @comment.place_vote(params[:vote_type], current_user)
    redirect "/questions/#{@comment.commentable.question.id}"
  else
    redirect "/questions/#{@comment.commentable.question.id}"
  end
end

