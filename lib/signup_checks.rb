require 'data_base_connection'

class SignupChecks

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
end
