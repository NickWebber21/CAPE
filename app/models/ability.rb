# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(current_user)
    user_role = current_user.role

    can :read, StaticPagesController

    case user_role
      when 'Instructor/TA'
        can :manage, :all
        # Instructors and TAs can read, create, and update evaluations.
        can [:read, :create, :update], Evaluation
      when 'Student'
        # Students can read presentations.
        can :read, Presentation

        # Students can view all evaluations. The content of the page will be limited.
        can :index, Evaluation

        # Students can read evaluations that they own or that are associated with a presentation that they authored.
        can :show, Evaluation do |evaluation|
          evaluation.user_id == current_user.id || Author.exists?(user_id: current_user.id, presentation_id: evaluation.presentation_id)
        end

        # Students can create evaluations.
        can [:create], Evaluation

        # Students can see other users and update their own user profile.
        can :read, User
        can :update, User, id: current_user.id
      end
  end
end
