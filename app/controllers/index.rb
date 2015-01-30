enable :sessions

def require_logged_in
    redirect ('/') unless is_authenticated?
end

def is_authenticated?
    return session[:name]
end

get '/' do
	
  # Look in app/views/index.erb
  erb :index
end

post '/login' do
  # Look in app/views/index.erb
  User.find_or_create_by(name: params[:name],password: params[:password])
  session[:name] = params[:name]
  redirect to '/front_page'
end

get '/front_page' do
	require_logged_in
	@all_deck = Deck.all
	erb :'front_page'
end

post '/front_page' do
	session[:choice] = params[:choice]
	session[:counter_questions] = 0
	session[:counter_correct] = 0
	session[:counter_incorrect] = 0
	redirect to '/game'

end

post '/logout' do
	session.clear
	redirect to '/'
end

get '/game' do
	@n = session[:choice].to_i
	@deck = Deck.find(@n)
	@deck_title = @deck.title
	@user = User.where(name: session[:name])
	# @this_round = @user.rounds.create(deck_used: @deck)
	@card = @deck.cards.all
	random = (Random.new.rand(@card.first.id..@card.last.id))
	@new_card = @deck.cards.all.find random
	@question = @new_card[:question]
	session[:question] = @question
	@answer = @new_card[:answer]
	session[:answer] = @answer
	

	erb :game
end

post '/game' do
	new_counter = session[:counter_questions]
	new_counter += 1
	session[:counter_questions] = new_counter.to_s
	# @counter_incorrect = 0
	# while session[:counter_questions] != 5
	# 	if params[:answer] == session[:answer]
	# 		counter_correct += 1
	# 		session[:counter_correct] = counter_correct
		redirect to '/game'
	# 	else
	# 		counter_incorrct += 1
	# 		session[:counter_incorrct] = counter_incorrect
	# 		redirect to'/game'
	# 	end
	# 	counter_questions += 1
	# 	session[:counter_question] = counter_question
		
	# end	
end