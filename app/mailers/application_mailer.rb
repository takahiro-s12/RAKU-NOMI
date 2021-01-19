# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: '幹事 <from@example.com>'
  layout 'mailer'
end
