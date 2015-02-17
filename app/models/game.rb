class Game < ActiveRecord::Base

  belongs_to :quiz
  belongs_to :creator, class_name: 'User'
  has_many :participations
  has_many :participating_users, through: :participations, source: :user

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

  def current_quiz_question
    quiz.quiz_questions.detect do |quiz_question|
      quiz_question.given_answers.count < participations.count
    end
  end


end