# frozen_string_literal: true
module Europeana
  module FeedbackButton
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception
    end
  end
end
