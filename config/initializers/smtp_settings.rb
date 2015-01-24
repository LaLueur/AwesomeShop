ActionMailer::Base.smtp_settings = {
    :address => 'smtp.gmail.com',
    :port => '587',
    :domain => 'gmail.net',
    :user_name => 'ExhaustiveTesting@gmail.com',
    :password => "testmetotally",
    :authentication => "plain",
    :enable_starttls_auto => true
}