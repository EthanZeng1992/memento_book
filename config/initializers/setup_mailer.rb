Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { :host => "localhost:3000" }
  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :domain               => "gmail.com",
    :port                 => 587,
    :user_name            => 'zmdyiwei@gmail.com',
    :password             => '*%z&m&d%*',
    :authentication       => 'plain',
    :enable_starttls_auto => true
  }
end
