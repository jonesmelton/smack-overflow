 post '/comments/:comment_id/votes' do
  authorize!
  @comment = Comment.find(params[:comment_id])
  @vote = @comment.votes.find_by(user: current_user)
  if @vote
    @vote.destroy
  end
  @comment.place_vote(params[:vote_type], current_user)
  if request.xhr?
    content_type :json
    {score: @comment.score}.to_json
  else
    redirect "/questions/#{@comment.commentable.question.id}"
  end
end

