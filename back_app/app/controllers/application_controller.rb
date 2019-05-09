class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    protected
    def not_found
        render '{"error": "Não encontrado"}', status: :not_found
    end
end
