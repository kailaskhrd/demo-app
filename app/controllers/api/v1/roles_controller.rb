# encoding: utf-8
module Api
  module V1
    class RolesController < ApiController
      def index
        @roles = Role.all
      end
    end
  end
end
