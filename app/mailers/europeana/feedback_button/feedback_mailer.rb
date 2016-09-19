# frozen_string_literal: true
module Europeana
  module FeedbackButton
    class FeedbackMailer < ApplicationMailer
      include FeedbackHelper

      def post(text:, type:, page:, ip:)
        fail Errors::NoRecipient unless feedback_enabled?

        @text = text
        @type = type
        @page = page
        @ip = ip

        mail(to: Rails.application.config.x.feedback_mail_to, subject: 'User feedback')
      end
    end
  end
end
