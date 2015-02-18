class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role? :admin
      can :manage, :all
    elsif user.persisted?
      can :create, Game
      can :read, Game
      can :update, Game
      can :destroy, Game
      can :create, Quiz
      can :read, Quiz
      can :update, Quiz
      can :destroy, Quiz
      can :create, Question
      can :read, Question
      can :update, Question
      can :destroy, Question
    else

    end
  end
end