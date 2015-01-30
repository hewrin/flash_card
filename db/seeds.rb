deck = Deck.create(title: "Ruby Questions")

main_array = []
answer =[]
question =[]

File.readlines("flashcard_samples.txt").each do |line|
	line.gsub!(/\n/,"")
    main_array << line
end

counter = 0
    while counter < main_array.length
      #main_array[counter] = main_array[counter].gsub! /\t/,''	
      question << main_array[counter]
      counter += 1
      answer  << main_array[counter]
      counter += 1

end

counter = 0

while counter < answer.length
	deck.cards.create(question: question[counter], answer: answer[counter])
		counter += 1
end
