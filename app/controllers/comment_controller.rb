 post '/comments/:comment_id/votes' do
  @comment = Comment.find(params[:comment_id])
  if params[:vote_type] == "💩"
    vote_value = -1
  else
    vote_value = 1
  end

  vote = @comment.votes.find_by(user: current_user)
  if vote
    vote.vote_value = vote_value
    vote.save
    redirect "/questions/#{@comment.commentable.question.id}"
  else
    @comment.votes << Vote.new(vote_value: vote_value, user: current_user)
    redirect "/questions/#{@comment.commentable.question.id}"
  end


end
