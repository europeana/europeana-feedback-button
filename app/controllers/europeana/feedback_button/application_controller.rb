# frozen_string_literal: true
module Europeana
  module FeedbackButton
    class ApplicationController < ActionController::Base
      protect_from_forgery

      before_action :fail_unless_feedback_enabled

      rescue_from ApplicationError do |exception|
        respond_to do |format|
          format.json do
            response = { success: false, message: exception.message }
            response[:errors] = exception.errors if exception.errors.present?
            render json: response, status: 400
          end
        end
      end

      rescue_from NoRecipientError do |exception|
        respond_to do |format|
          format.json do
            response = { success: false, message: exception.message }
            render json: response, status: 500
          end
        end
      end

      protected

      def fail_unless_feedback_enabled
        fail NoRecipientError, 'Feedback is not enabled' unless Europeana::FeedbackButton.enabled?
      end
    end
  end
end
