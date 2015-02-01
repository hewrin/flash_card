
get "/game/rounds/:r_id/deck/:d_id/cards/:c_id" do
	 @this_round = Round.find params[:r_id]
	 @deck = Deck.find params[:d_id]
	@card = Card.find params[:c_id]
	erb :'cards/card_show'
end

	# @deck = Deck.find params[:d_id]
	# byebug
	# @card = @deck.cards.all
	# random = (Random.new.rand(@card.first.id..@card.last.id))
	# @new_card = @deck.cards.all.find random
	# @question = @new_card[:question]
	# session[:question] = @question
	# @x = params[:d_id]