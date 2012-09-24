ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "mohhaiti.org",
  :user_name            => "lindsey@mohhaiti.org",
  :password             => "panchos45",
  :authentication       => "plain",
  :enable_starttls_auto => true
}