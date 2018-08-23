# frozen_string_literal: true

module Europeana
  module FeedbackButton
    class WordCountValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return if options[:allow_nil] && value.nil?
        return if options[:allow_blank] && value.blank?

        minimum = options[:minimum] || 5

        word_count = value&.strip&.scan(/\w+/)&.size || 0
        unless word_count >= minimum
          record.errors[attribute] << (options[:message] || "has too few words (#{word_count} < #{minimum})" )
        end
      end
    end
  end
end
