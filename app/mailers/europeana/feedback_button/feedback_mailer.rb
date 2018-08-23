# frozen_string_literal: true

module Europeana
  module FeedbackButton
    class FeedbackMailer < ApplicationMailer
      def post(text:, type:, page:, email: nil)
        fail NoRecipientError unless Europeana::FeedbackButton.enabled?

        @text = text
        @type = type
        @page = page
        @email = email

        mail_options = {
          to: Europeana::FeedbackButton.mail_to,
          subject: text.truncate(100, separator: ' ')
        }
        mail(mail_options)
      end
    end
  end
end
