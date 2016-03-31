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

get '/questions/:question_id/comments/new' do
  authorize!
  @question = Question.find(params[:question_id])
  erb :'questions/new_comment'
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
