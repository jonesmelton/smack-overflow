get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

#need to insert current_user as the user who posted the question
#hidden formfield, line 5 of questions/new erb
post '/questions' do
  @question = Question.new(params[:question])
  if @question.save
    redirect '/questions'
  else
    erb :'questions/new'
  end
end



get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end
