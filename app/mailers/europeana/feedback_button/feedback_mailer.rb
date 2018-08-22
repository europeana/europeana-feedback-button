# frozen_string_literal: true
module Europeana
  module FeedbackButton
    class FeedbackMailer < ApplicationMailer
      include FeedbackHelper

      def post(text:, type:, page:)
        fail Errors::NoRecipient unless feedback_enabled?

        @text = text
        @type = type
        @page = page

        mail(to: Rails.application.config.x.feedback_mail_to, subject: text.truncate(100, separator: ' '))
      end
    end
  end
end
