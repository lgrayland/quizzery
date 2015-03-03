class GivenAnswer < ActiveRecord::Base
  
  belongs_to :quiz_question
  belongs_to :participation
  belongs_to :answer_choice
  belongs_to :game
  has_one :user, through: :participation

  validates :participation_id, :uniqueness => {:scope => [:quiz_question_id]}

end