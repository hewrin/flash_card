class CreateGuesses < ActiveRecord::Migration
  def change
  	create_table :guesses do |t|
  		t.string :input
  		t.boolean :correct? 
  	end
  end
end
