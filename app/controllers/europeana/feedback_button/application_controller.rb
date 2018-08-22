# frozen_string_literal: true
module Europeana
  module FeedbackButton
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception

      before_action :fail_unless_feedback_enabled

      class ApplicationError < StandardError; end

      rescue_from ApplicationError do |exception|
        respond_to do |format|
          format.json do
            response = { success: false }
            response[:errors] = @errors if @errors.present?
            render json: response, status: 500
          end
        end
      end

      protected

      def fail_unless_feedback_enabled
        fail ApplicationError, 'Feedback is not enabled' unless feedback_enabled?
      end
    end
  end
end
