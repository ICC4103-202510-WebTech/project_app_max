# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here
    return unless user.present?

    if user.role == "admin"
      # Admin can manage all
      can :manage, :all
    else
      # Regular users can manage their own tasks
      can :read, Task
      can :create, Task
      can [ :update, :destroy ], Task, user_id: user.id
    end
  end
end
