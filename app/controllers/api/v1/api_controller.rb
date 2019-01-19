# encoding: utf-8
module Api
  module V1
    class ApiController <  ActionController::Base
      before_action :authenticate_user!
      helper_method :current_user

      def authenticate_user!
        return true if authenticate_token
        render json: { errors: [ { detail: "Access denied" } ] }, status: 401
      end

      def current_user
        @current_user ||= authenticate_token
      end

      private
        def authenticate_token
          authenticate_with_http_token do |token, options|
            User.where(auth_token: token).where("token_created_at >= ?", 1.day.ago).first
          end
        end
    end
  end
end
