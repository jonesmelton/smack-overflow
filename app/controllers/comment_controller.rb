 post '/comments/:comment_id/votes' do
  @comment = Comment.find(params[:comment_id])
  # if params[:vote_type] == "💩"
  #   vote_value = -1
  # else
  #   vote_value = 1
  # end
  # @vote = @comment.votes.new(vote_value: vote_value, user: current_user)
  if @comment.place_vote(params[:vote_type], current_user)
    redirect "/questions/#{@comment.commentable.question.id}"
  else
    puts "something fucked up"
    redirect "/questions/#{@comment.commentable.question.id}"
  end
end

