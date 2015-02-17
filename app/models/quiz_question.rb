class QuizQuestion < ActiveRecord::Base

  belongs_to :quiz
  belongs_to :question
  has_many :given_answers

  acts_as_list scope: :quiz_id

  default_scope -> { order(:position) }

end
