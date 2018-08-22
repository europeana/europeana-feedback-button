# frozen_string_literal: true
module Europeana
  module FeedbackButton
    class FeedbackController < ApplicationController
      include FeedbackHelper

      def create
        if feedback_enabled? && FeedbackMailer.post(mailer_post_args).deliver_later
          respond_to do |format|
            format.json { render json: { success: true } }
          end
        else
          respond_to do |format|
            format.json { render json: { success: false }, status: 500 }
          end
        end
      end

      private

      def mailer_post_args
        params.permit(:text, :type, :page)
      end
    end
  end
end
