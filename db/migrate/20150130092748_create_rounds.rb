class CreateRounds < ActiveRecord::Migration
  def change
  	create_table :rounds do |t|
  		t.string :deck_used
  		t.integer :no_of_guess
  		t.integer :no_of_correct
  		t.integer :no_of_incorrect
  		t.integer :user_id
  	end
  end
end
