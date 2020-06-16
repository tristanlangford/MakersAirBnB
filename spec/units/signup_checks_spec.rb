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
end
