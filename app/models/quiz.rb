class Quiz < ActiveRecord::Base

  has_many :questions, through: :quizquestions
  has_many :games
  belongs_to :creator, class_name: 'User'

end
