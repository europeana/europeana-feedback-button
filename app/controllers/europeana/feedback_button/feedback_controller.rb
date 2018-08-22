# frozen_string_literal: true

module Europeana
  module FeedbackButton
    class FeedbackController < ApplicationController
      include FeedbackHelper

      def create
        feedback = Feedback.new(feedback_params)

        feedback.validate

        unless feedback.valid?
          @errors = feedback.errors.messages
          fail ApplicationError
        end

        FeedbackMailer.post(**mailer_post_args).deliver_later

        respond_to do |format|
          format.json { render json: { success: true } }
        end
      end

      private

      def feedback_params
        @feedback_params ||= params.permit(:text, :type, :page, :email, :privacy_policy)
      end

      def mailer_post_args
        feedback_params.to_h.symbolize_keys.slice(:text, :type, :page, :email)
      end
    end
  end
end
