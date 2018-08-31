# frozen_string_literal: true

module Europeana
  module FeedbackButton
    class FeedbackController < Europeana::FeedbackButton::ApplicationController
      def create
        feedback = Feedback.new(feedback_params)

        feedback.validate

        unless feedback.valid?
          fail ApplicationError.new('Feedback is invalid. See "errors" for details.',
                                    errors: feedback.errors.messages)
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
