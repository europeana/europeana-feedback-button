# frozen_string_literal: true
class ApplicationMailer < ActionMailer::Base
  default from: 'from@exmaple.com'
  layout 'mailer'
end
