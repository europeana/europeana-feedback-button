# frozen_string_literal: true

module Europeana
  module FeedbackButton
    # Feedback form display methods
    module FeedbackableView
      extend ActiveSupport::Concern

      def feedback
        return nil unless Europeana::FeedbackButton.enabled?

        {
          form_action: europeana_feedback_button.feedback_path,
          maxlength: Europeana::FeedbackButton::Feedback::MAX_LENGTH,
          minwords: Europeana::FeedbackButton::Feedback::MIN_WORDS
        }
      end
    end
  end
end
