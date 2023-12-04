# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(current_user)
    user_role = current_user.role

    can :read, StaticPagesController

    case user_role
      when 'Instructor/TA'
        can :manage, :all
      when 'Student'
        # Students can read presentations.
        can :read, Presentation
        # Students can read, create, and update evaluations that they own.
        can [:read, :create, :update], Evaluation do |evaluation|
          evaluation.user_id == current_user.id
        end
        # Students can read and update their own user profile.
        can [:read, :update], User, id: current_user.id
      end
  end
end
