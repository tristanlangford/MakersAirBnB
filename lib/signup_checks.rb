require 'data_base_connection'
require 'uri'

class SignupChecks

  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP

  def self.check_email_exists(email)
    emails = Database_connection.query("SELECT email FROM users WHERE email = '#{email}'")
    emails.each do |row|
      return true if row['email'] == email
    end
    false
  end

  def self.passwords_match?(password, confirm_password)
    password == confirm_password
  end

  def self.email_format_correct?(email)
    !!(email =~ VALID_EMAIL_REGEX)
  end
end
