get '/answers/:answer_id/comments/new' do
  authorize!
  @answer = Answer.find(params[:answer_id])
  erb :'answers/new_comment'
end

post '/answers/:answer_id/comments' do
  authorize!
  @answer = Answer.find(params[:answer_id])
  @comment = @answer.comments.new(params[:comment])
  if @comment.save
    redirect "/questions/#{@answer.question.id}"
  else
    erb :'answers/new_comment'
  end
end

post '/answers/:answer_id/votes' do
  authorize!
  @answer = Answer.find(params[:answer_id])
  @vote = @answer.votes.find_by(user: current_user)
  if @vote
    @vote.destroy
  end
  @answer.place_vote(params[:vote_type], current_user)
  if request.xhr?
    content_type :json
    {score: @answer.score}.to_json
  else
    redirect "/questions/#{@answer.question.id}"
  end
end

# a question belongs to its best answer
# processes the edit request to change question instance
put '/answers/:answer_id/questions/:id' do
  authorize!
  best_answer = Answer.find(params[:answer_id])
  @question = Question.find(params[:id])
  if owner?(@question)
    @question.update_attributes(best_answer_id: best_answer.id)
    redirect "/questions/#{@question.id}"
  else
    redirect "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
  end
end
