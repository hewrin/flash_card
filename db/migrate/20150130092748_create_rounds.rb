class CreateRounds < ActiveRecord::Migration
  def change
  	create_table :rounds do |t|
  		t.string :deck_used
  		t.integer :no_of_guess ,default: 0
  		t.integer :no_of_correct ,default: 0
  		t.integer :no_of_incorrect ,default: 0
  		t.integer :user_id
  	end
  end
end
