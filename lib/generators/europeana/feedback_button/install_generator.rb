# frozen_string_literal: true

module Europeana
  module FeedbackButton
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc 'Creates an initializer for Europeana::FeedbackButton.'

      def copy_initializer_file
        copy_file 'europeana_feedback_button.rb', 'config/initializers/europeana_feedback_button.rb'
      end
    end
  end
end
