class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role? :admin
      can :manage, :all
    elsif user.persisted?
      can :read, Game, :creator_id => user.id
      can :create, Game
    else

    end
  end
end