module SolidQueuePlus
  module Dashboard
    class ApplicationController < ActionController::Base
      before_action :authenticate_admin!

      private

      def authenticate_admin!
        head :unauthorized unless Rails.env.development?
      end
    end
  end
end
