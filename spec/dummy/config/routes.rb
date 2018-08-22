# frozen_string_literal: true

Rails.application.routes.draw do
  mount Europeana::FeedbackButton::Engine, at: '/'
end
