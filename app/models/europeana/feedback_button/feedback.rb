# frozen_string_literal: true

module Europeana
  module FeedbackButton
    class Feedback
      include ActiveModel::Model

      MAX_LENGTH = 400.freeze
      MIN_WORDS = 5
      TYPES = %w(comment correction bug).freeze

      attr_accessor :text, :type, :page, :email, :privacy_policy

      validates :text, :type, :page, presence: true
      validates :type, inclusion: { in: TYPES }
      validates :privacy_policy, acceptance: true, allow_nil: false, allow_blank: false
      validates :text, length: { maximum: MAX_LENGTH }
      validates :text, word_count: { minimum: MIN_WORDS }
    end
  end
end
