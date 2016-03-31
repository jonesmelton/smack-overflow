 post '/comments/:comment_id/votes' do
  authorize!
  @comment = Comment.find(params[:comment_id])
  @comment.place_vote(params[:vote_type], current_user)
  if request.xhr?
    content_type :json
    {score: @comment.score}.to_json
  else
    redirect "/questions/#{@comment.commentable.question.id}"
  end
end

