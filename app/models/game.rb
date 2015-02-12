class Game < ActiveRecord::Base

  belongs_to :quiz
  belongs_to :creator, class_name: 'User'
  has_many :participations
  has_many :participating_users, through: :participations, source: :user

  def participation_for(user)
    participations.find_by(user_id: user.id)
  end
end