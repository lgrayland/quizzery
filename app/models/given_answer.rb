class GivenAnswer < ActiveRecord::Base
  
  belongs_to :quiz_question
  belongs_to :participation
  belongs_to :answer_choice
  has_one :user, through: :participation

end