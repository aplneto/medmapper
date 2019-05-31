module ApplicationHelper
    def user_profile_info
        if UserProfile.exists?(account_id: current_account.id)
            UserProfile.find(current_account.id).name
        else
            current_account.email
        end
    end
end
