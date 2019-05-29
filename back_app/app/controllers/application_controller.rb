class ApplicationController < ActionController::Base
    protect_from_forgery

    def verify_account_confirmation
        if current_account.confirmed_at.nil?
            flash[:notice] = "Você precisa confirmar seu email para continuar"
            redirect_to new_account_confirmation_path
        end
    end
    
    
end
