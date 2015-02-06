class Participation < ActiveRecord::Base

  belongs_to :user
  belongs_to :game
  has_many :given_answers

end
