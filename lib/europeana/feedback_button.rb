# frozen_string_literal: true

require 'europeana/feedback_button/engine'

module Europeana
  module FeedbackButton
    class << self
      # @return [String] Email recipient of feedback submissions
      attr_accessor :mail_to

      # Is feedback enabled?
      #
      # Feedback will be enabled if +mail_to+ is set.
      #
      # @return [Boolean]
      def enabled?
        mail_to.present?
      end
    end

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
