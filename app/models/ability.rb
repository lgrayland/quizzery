class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role? :admin
      can :manage, :all
    elsif user.persisted?
      can :create, Game
      can :read, Game
      can :update, Game, user_id: user.id
      can :destroy, Game, user_id: user.id
      can :create, Quiz
      can :read, Quiz
      can :update, Quiz, user_id: user.id
      can :destroy, Quiz, user_id: user.id
      can :create, Question
      can :read, Question
      can :update, Question, user_id: user.id
      can :destroy, Question, user_id: user.id
    else

    end
  end
end