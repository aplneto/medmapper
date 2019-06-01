module ProfessionalProfilesHelper

    def user_has_professional_profile?(user_profile)
        ProfessionalProfile.exists?(user_profile_id: user_profile.id)
    end
    
end
