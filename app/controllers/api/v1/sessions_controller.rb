# encoding: utf-8
module Api
  module V1
    class SessionsController < ApiController
      skip_before_action :authenticate_user!, only: [:create]

      def create
        resource = User.find_for_database_authentication(:username => user_params[:username])
        resource ||= User.new

        if resource.valid_password?(user_params[:password])
          auth_token = resource.generate_auth_token
          render json: { auth_token: auth_token }
        else
          invalid_login_attempt
        end
      end

      def destroy
        resource = current_user
        resource.invalidate_auth_token
        head :ok
      end

      private
        def user_params
          params.require(:user).permit(:username, :password)
        end

        def invalid_login_attempt
          render json: { errors: [ { detail:"Error with your login or password" }]}, status: 401
        end
    end
  end
end
