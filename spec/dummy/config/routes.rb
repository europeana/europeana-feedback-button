# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  mount Europeana::FeedbackButton::Engine, at: '/europeana/feedback_button'
end
