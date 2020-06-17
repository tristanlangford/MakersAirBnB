require 'signup_checks'

describe SignupChecks do

  let(:add_user) { Database_connection.query(("INSERT INTO users (email, first_name, last_name,
  password) VALUES ('some_email@hotmail.com', 'Tristan', 'Langford', 'password');")) }

  describe '#check_email_exists' do
    it "checks to see if email already exists in DB" do
        add_user
        email = 'some_email@hotmail.com'
        expect(SignupChecks.check_email_exists(email)).to eq(true)
    end

    it "checks to see if email already exists in DB" do
        add_user
        email = 'som_email@hotmail.com'
        expect(SignupChecks.check_email_exists(email)).to eq(false)
    end
  end

  describe '#passwords_match?' do
    it 'returns true if password equals confirm password' do
      expect(SignupChecks.passwords_do_not_match?('password', 'password')).to be false
    end

    it 'returns false if password does not equal confirm password' do
      expect(SignupChecks.passwords_do_not_match?('passwor', 'password')).to be true
    end
  end

  describe '#email_format_correct?' do
    it 'should return true if email is formatted correctly' do
      expect(SignupChecks.email_format_incorrect?('some_email@hotmail.com')).to be false
    end

    it 'should return false if email is formatted incorrectly' do
      expect(SignupChecks.email_format_incorrect?('some_emailhotmail.com')).to be true
    end
  end

  describe '#signup_checks' do

    it 'returns email exists when #check_email_exists is true' do
      add_user
      expect(SignupChecks.signup_checks('some_email@hotmail.com', 'password', 'password')).to eq(:email_exists)
    end

    it 'returns passwords_do_not_match if #passwords_match? returns false' do
      add_user
      expect(SignupChecks.signup_checks('some_email1@hotmail.com', 'password', 'password1')).to eq(:passwords_do_not_match)
    end

    it 'returns email_format_incorrect if #email_format_incorrect?' do
      add_user
      expect(SignupChecks.signup_checks('some_email1hotmail.com', 'password', 'password')).to eq(:email_format_incorrect)
    end
  end
end
