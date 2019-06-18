# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can %i[create read], Comment
      can %i[update destroy], Comment, user_id: user.id
      can :read, UserProfile
      can %i[create update destroy], UserProfile, user_id: user.id
      can :read, [FamilyHealthSupportCenter, ProfessionalProfile]
      can %i[read create update], ServiceProvider
      if user.admin?
        can :manage, :all
      elsif user.professional?
        can %i[update destroy], ProfessionalProfile, user_id: user.id
      elsif user.collaborator?
        can %i[read create update], HealthUnit
      elsif user.normal?
        can :create, ProfessionalProfile, user_id: user.id
      end
    end
  end
end
