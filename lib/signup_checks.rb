require_relative 'data_base_connection'
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

  def self.passwords_do_not_match?(password, confirm_password)
    password != confirm_password
  end

  def self.email_format_incorrect?(email)
    !(email =~ VALID_EMAIL_REGEX)
  end

  def self.signup_checks(email, password, confirm_password)
    return :email_exists if check_email_exists(email)
    return :passwords_do_not_match if passwords_do_not_match?(password, confirm_password)
    return :email_format_incorrect if email_format_incorrect?(email)
  end

  def sign_in_checks(email, password)
    return :email_does_not_exist if !check_email_exists(email)
    return :passwords_do_not_match if !passwords_do_not_match(password, get_password_from_db(email))
  end

  private

  def get_password_from_db(email)
    password = Database_connection.query("SELECT password FROM users WHERE email = '#{email}'")
    password.each do |row|
      return row['password']
    end
  end
end
