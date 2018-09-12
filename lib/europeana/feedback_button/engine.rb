# frozen_string_literal: true

module Europeana
  module FeedbackButton
    class Engine < ::Rails::Engine
      isolate_namespace Europeana::FeedbackButton

      engine_name 'europeana_feedback_button'

      config.generators do |g|
        g.test_framework :rspec
      end

      config.autoload_paths += %W(
        #{config.root}/app/validators
        #{config.root}/app/views/concerns
      )
    end
  end
end
