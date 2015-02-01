enable :sessions



def require_logged_in
    redirect ('/') unless is_authenticated?
end

def is_authenticated?
	#will return true if session[:name] exists, which will only happen when logged in
    return session[:name]
end

get '/' do
	
  # Look in app/views/index.erb
  erb :index
end

post '/login' do
  # finds or creates user and saves name to session
  User.find_or_create_by(name: params[:name],password: params[:password])
  session[:name] = params[:name]
  redirect to '/front_page'
end

get '/front_page' do
	require_logged_in
	@all_deck = Deck.all
	@user = User.find_by(name: session[:name])
	@this_round = @user.rounds.create
	erb :'front_page'
end



post '/logout' do
	session.clear
	redirect to '/'
end


		
	
