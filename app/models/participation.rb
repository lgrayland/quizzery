class Participation < ActiveRecord::Base

  belongs_to :user
  belongs_to :game
  has_many :given_answers

  def current_score
    given_answers.count { |given_answer| given_answer.answer_choice.correct }
  end

end
