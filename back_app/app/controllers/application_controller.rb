class ApplicationController < ActionController::Base
    protect_from_forgery

    def verify_account_confirmation
        if current_account.confirmed_at.nil?
            redirect_to new_account_confirmation_path,
            notice: "Você precisa confirmar seu email para continuar"
        end
    end
    
    def assert_account_has_profile
        unless UserProfile.exists?(account_id: current_account.id)
            redirect_to new_user_profile_path,
            notice: "Você precisa concluir a criação do seu perfil para 
            continuar"
        end
    end
    
end
