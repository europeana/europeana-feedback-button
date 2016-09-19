module Europeana
  module FeedbackButton
    class Engine < ::Rails::Engine
      engine_name 'europeana_feedback_button'

      config.generators do |g|
        g.test_framework :rspec
      end

      config.autoload_paths += %W(
        #{config.root}/app/views/concerns
        #{config.root}/app/views/layouts
      )
    end
  end
end
