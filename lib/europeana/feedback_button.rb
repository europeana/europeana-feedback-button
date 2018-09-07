# frozen_string_literal: true

require 'europeana/feedback_button/engine'

module Europeana
  module FeedbackButton
    PRIVACY_POLICY_URL = 'https://www.europeana.eu/portal/rights/privacy.html'

    class << self
      # @return [String] Email recipient of feedback submissions
      attr_accessor :mail_to

      # @return [String] URL to the privacy policy users must accept
      attr_accessor :privacy_policy_url

      # Is feedback enabled?
      #
      # Feedback will be enabled if +mail_to+ is set.
      #
      # @return [Boolean]
      def enabled?
        mail_to.present?
      end
    end

    self.privacy_policy_url = PRIVACY_POLICY_URL

    class ApplicationError < StandardError
      attr_reader :errors

      def initialize(message, **options)
        super(message)
        @errors = options[:errors]
      end
    end

    class NoRecipientError < StandardError; end
  end
end
