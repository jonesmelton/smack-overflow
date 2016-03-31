 post '/comments/:comment_id/votes' do
  @comment = Comment.find(params[:comment_id])
  if params[:vote_type] == "💩"
    vote_value = -1
  else
    vote_value = 1
  end
  @vote = @comment.votes.new(vote_value: vote_value)
  if @vote.save
    redirect "/questions/#{@comment.commentable.question.id}"
  else
    erb :'votes/new'
  end
end
