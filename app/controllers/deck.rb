# post '/game/deck/:d_id' do 
# 	@deck = Deuck.find params[:d_id]
# 	erb :deck
# end

get '/game/rounds/:r_id/deck/:d_id' do
	#finds the corresponding round and deck and counts the number of questions asked. Max number of question is set to 5
	 @this_round = Round.find params[:r_id]
	 @deck = Deck.find params[:d_id]
	 q_counter = @this_round.no_of_guess
	 q_counter += 1
	 @this_round.update(deck_used: @deck.title, no_of_guess: q_counter)
	 if q_counter == 5
	 	redirect to "/game/rounds/#{@this_round.id}/deck/#{@deck.id}/results"
	 else   	 
	 	
	 	@card = @deck.cards.all
	 	random = (Random.new.rand(@card.first.id..@card.last.id))
	 	@new_card = @deck.cards.all.find random
	 	@question = @new_card[:question]

	 redirect to "/game/rounds/#{@this_round.id}/deck/#{@deck.id}/cards/#{@new_card.id}" 
	end
		
end

post "/game/rounds/:r_id/deck/:d_id/cards/:c_id/answer" do
	@this_round = Round.find params[:r_id]
	@deck = Deck.find params[:d_id]
	@card = Card.find params[:c_id]
	if params["answer"] == @card.answer 
		counter = @this_round.no_of_correct
		counter += 1
		@this_round.update(no_of_correct: counter)
	else
		counter = @this_round.no_of_incorrect
		counter += 1
		@this_round.update(no_of_incorrect: counter)
	end

	redirect to "/game/rounds/#{@this_round.id}/deck/#{@deck.id}"
end

get "/game/rounds/:r_id/deck/:d_id/results" do
	@this_round = Round.find params[:r_id]
	erb :result
end








