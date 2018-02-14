# frozen_string_literal: true
Europeana::FeedbackButton::Engine.routes.draw do
  post 'feedback', to: 'feedback#create', defaults: { format: 'json' }
end
