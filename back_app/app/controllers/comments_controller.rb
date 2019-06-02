class CommentsController < ApplicationController
    before_action :authenticate_account!
    before_action :assert_account_has_profile
    before_action :set_page

    def create
      @comment = @page.comments.new comment_params
      @comment.user_profile = UserProfile.find_by account_id: current_account.id
      if @comment.save
        redirect_to @page
      else
        if ['ServiceProvider', 'ProfessionalProfile'].include? @page.class.name
          render "#{@page.class.name.underscore}/show"
        else
          render 'health_units/show', locals: { health_unit: @page }
        end
      end
    end

    def edit
    end

    def update
      comment = @comment.to_h
      comment['body'] = comment_params
      @comment.update(comment)
    end

    def destroy
    end

    private
      def comment_params
        params.require(:comment).permit(:body)
      end

      def set_page
        if params[:service_provider_id].present?
          @page = ServiceProvider.find(params[:service_provider_id])
        elsif params[:professional_profile_id].present?
          @page = ProfessionalProfile.find(params[:professional_profile_id])
        else
          id = params.keys.select { |key| /_id\z/.match(key)}[0]
          @page = HealthUnit.find(params[id])
        end
      end
  end