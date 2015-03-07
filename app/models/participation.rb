class Participation < ActiveRecord::Base

  belongs_to :user
  belongs_to :game
  has_one :quiz, through: :game
  has_many :given_answers
  has_many :answered_quiz_questions, through: :given_answers, source: :quiz_question

  validates :game_id, presence: true
  validates :user_id, presence: true

  # def current_score
  #   given_answers.count{ |given_answer| given_answer.answer_choice.correct }
  #   # raise
  # end

  def current_quiz_question
    quiz.quiz_questions.detect do |quiz_question|
      !answered_quiz_question_ids.include?(quiz_question.id)
    end
  end

  def answered_all_questions?
    given_answers.count == quiz.questions.count
  end

end
