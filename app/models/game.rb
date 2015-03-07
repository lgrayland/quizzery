class Game < ActiveRecord::Base

  belongs_to :quiz
  belongs_to :creator, class_name: 'User'
  has_many :given_answers
  has_many :participations
  has_many :participating_users, through: :participations, source: :user

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  include AASM

  aasm column: :status do
    state :inviting, :initial => true
    state :playing
    state :finished

    event :play do
      transitions :from => :inviting, :to => :playing
    end

    event :finish do
      transitions :from => :playing, :to => :finished
    end
  end

  def participation_for(user)
    participations.find_by(user_id: user.id)
  end

  def game_playing
    @game.status = true
  end

  def total_number_of_answers_given
    given_answers.count
  end

  def number_of_questions_answered
    given_answers.count / participations.count
  end

  def number_of_quiz_questions
    quiz.questions.count
  end

  def all_participants_answered?
    given_answers.count % participations.count == 0
  end

  def over?
    number_of_quiz_questions == number_of_questions_answered
    
  end

  def current_quiz_question
    quiz.quiz_questions[number_of_questions_answered] if !over?
  end


end