class Card < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :deck
  has_one :guess
end
