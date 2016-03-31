# a question belongs to its best answer
# processes the edit request to change question instance
put '/answers/:answer_id/questions/:id' do
  best_answer = Answer.find(params[:answer_id])
  @question = Question.find(params[:id])
  if owner?(@question)
    @question.update_attributes(best_answer_id: best_answer.id)
    redirect "/questions/#{@question.id}"
  else
    redirect "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
  end
end
