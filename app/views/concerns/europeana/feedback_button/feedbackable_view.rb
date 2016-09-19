# frozen_string_literal: true

module Europeana
  module FeedbackButton
    ##
    # Feedback form display methods
    module FeedbackableView
      extend ActiveSupport::Concern

      def feedback
        return nil unless feedback_enabled?
        {
            form_action: "/feedback",
            maxlength: 400,
            minwords: 5
        }
      end
    end
  end
end