class CommentsController < ApplicationController
    before_action :authenticate_account!
    before_action :assert_account_has_profile
    before_action :set_page

    def create
      @comment = @page.comments.new comment_params
      @comment.user_profile = UserProfile.find_by account_id: current_account.id
      @comment.save!
      redirect_to @page
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
        if params[:health_unit_id].present?
          @page = HealthUnit.find(params[:health_unit_id])
        elsif params[:service_provider_id].present?
          @page = ServiceProvider.find(params[:service_provider_id])
        elsif params[:professional_profile_id].present?
          @page = ProfessionalProfile.find(params[:professional_profile_id])
        end
      end
  end