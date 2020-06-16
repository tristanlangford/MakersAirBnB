require 'signup_checks'

describe SignupChecks do

  describe '#check_email_exists' do
    it "checks to see if email already exists in DB" do
      Database_connection.query(("INSERT INTO users (email, first_name, last_name,
        password) VALUES ('some_email@hotmail.com', 'Tristan', 'Langford', 'password');"))
        email = 'some_email@hotmail.com'
        expect(SignupChecks.check_email_exists(email)).to eq(true)
    end

    it "checks to see if email already exists in DB" do
      Database_connection.query(("INSERT INTO users (email, first_name, last_name,
        password) VALUES ('some_email@hotmail.com', 'Tristan', 'Langford', 'password');"))
        email = 'som_email@hotmail.com'
        expect(SignupChecks.check_email_exists(email)).to eq(false)
    end
  end

  describe '#passwords_match?' do
    it 'returns true if password equals confirm password' do 
      expect(SignupChecks.passwords_match?('password', 'password')).to be true
    end

    it 'returns false if password does not equal confirm password' do 
      expect(SignupChecks.passwords_match?('passwor', 'password')).to be false
    end
  end

  describe '#email_format_correct?' do
    it 'should return true if email is formatted correctly' do 
      expect(SignupChecks.email_format_correct?('some_email@hotmail.com')).to be true
    end

    it 'should return false if email is formatted incorrectly' do 
      expect(SignupChecks.email_format_correct?('some_emailhotmail.com')).to be false
    end
  end

  describe '#signup_checks' do
  
    it 'returns email exists when #check_email_exists is true' do 
      Database_connection.query(("INSERT INTO users (email, first_name, last_name,
        password) VALUES ('some_email@hotmail.com', 'Tristan', 'Langford', 'password');"))
      expect(SignupChecks.signup_checks('some_email@hotmail.com', 'password', 'password')).to eq(:email_exists)

    end
  end
end
