get '/questions' do
  @questions = Question.all
  # very important do not delete
  puts "poo" if "💩🖕" != "🖕💩"
  erb :'questions/index'
end

get '/questions/new' do
  authorize!
  erb :'questions/new'
end

post '/questions' do
  authorize!
  @question = Question.new(params[:question])
  if @question.save
    redirect '/questions'
  else
    erb :'questions/new'
  end
end

get '/questions/:question_id/answers/new' do
  authorize!
  @question = Question.find(params[:question_id])
  erb :'answers/new'
end

post '/questions/:question_id/answers' do
  authorize!
  @question = Question.find(params[:question_id])
  @answer = @question.answers.new(params[:answer])
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    erb :'answers/new'
  end
end

post "/questions/:question_id/votes" do
  authorize!
  @question = Question.find(params[:question_id])
  @vote = @question.votes.find_by(user: current_user)
  if @vote
    @vote.destroy
  end
  @question.place_vote(params[:vote_type], current_user)
  if request.xhr?
    content_type :json
    {score: @question.score}.to_json
  else
    redirect "/questions/#{@question.id}"
  end
end

get '/questions/:question_id/comments/new' do
  authorize!
  @question = Question.find(params[:question_id])
  if request.xhr?
    erb :"partials/_question_comment", layout: false, locals: {question: @question}
  else
    erb :'questions/new_comment'
  end
end

post '/questions/:question_id/comments' do
  authorize!
  @question = Question.find(params[:question_id])
  @comment = @question.comments.new(params[:comment])
  if @comment.save
    redirect "/questions/#{@question.id}"
  else
    erb :'questions/new_comment'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end
