MAILCHIMP_API_KEY = ENV['mailchimp_password']

Gibbon::Request.api_key = MAILCHIMP_API_KEY
Gibbon::Request.timeout = 15
Gibbon::Request.throws_exceptions = false