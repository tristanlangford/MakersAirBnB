feature 'signup' do

  before do
    visit('/signup')
  end

    scenario 'it allows the user to enter their email address' do
        fill_in('email', with: 'some_email@hotmail.com')
        expect(page).to have_content("Email:")
    end

    scenario 'it allows the user to enter their first name' do
        fill_in('first_name', with: 'Tristan')
        expect(page).to have_content("First name:")
    end

    scenario 'it allows the user to enter their last name' do
        fill_in('last_name', with: 'Langford')
        expect(page).to have_content("Last name:")
    end

    scenario 'it allows the user to enter their password' do
        fill_in('password', with: 'password')
        expect(page).to have_content("Password:")
    end

    scenario 'it allows the user to confirm their password' do
        fill_in('confirm_password', with: 'password')
        expect(page).to have_content("Confirm Password:")
    end

    scenario 'it allows the user to submit their information' do
        expect(page).to have_selector(:link_or_button, 'signup')
    end

  feature 'signup checks' do

    before do
      fill_in('first_name', with: 'Tristan')
      fill_in('last_name', with: 'Langford')
    end

    scenario 'should show an error message if email exists' do
      Database_connection.query(("INSERT INTO users (email, first_name, last_name,
      password) VALUES ('some_email@hotmail.com', 'Tristan', 'Langford', 'password');"))

      fill_in('email', with: 'some_email@hotmail.com')
      fill_in('password', with: 'password')
      fill_in('confirm_password', with: 'password')
      click_button('signup')
      expect(page).to have_content("An account already exists with this email address.")
    end

    scenario 'should show an error message if password and confrimed password don not match' do
      fill_in('email', with: 'some_email1@hotmail.com')
      fill_in('password', with: 'password')
      fill_in('confirm_password', with: 'password1')
      click_button('signup')
      expect(page).to have_content("Passwords don't match.")
    end

    scenario 'should show an error message if the email firmat is incorrect' do
      fill_in('email', with: 'some_email1hotmail.com')
      fill_in('password', with: 'password')
      fill_in('confirm_password', with: 'password')
      click_button('signup')
      expect(page).to have_content("Email address is invalid.")
    end

    scenario 'Should redirect to properties once signed up' do
      fill_in('first_name', with: 'Tristan')
      fill_in('last_name', with: 'Langford')
      fill_in('email', with: 'some_email@hotmail.com')
      fill_in('password', with: 'password')
      fill_in('confirm_password', with: 'password')
      click_button('signup')
      expect(page).to have_content("Tristan")
    end
  end
end
