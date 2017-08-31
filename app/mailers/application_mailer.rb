class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  layout 'mailer'
end

class UserMailer < ApplicationMailer
end

