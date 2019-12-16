class ApplicationMailer < ActionMailer::Base
  default to: 'contact@example.com'
  default from: 'contact@example.com'
  layout 'mailer'
end
