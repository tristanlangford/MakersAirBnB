feature 'signup' do

    scenario 'it allows the user to enter their email address' do
        visit('/signup')
        fill_in('email', with: 'some_email@hotmail.com')
        expect(page).to have_content("Email:")
    end

    scenario 'it allows the user to enter their first name' do
        visit('/signup')
        fill_in('first_name', with: 'Tristan')
        expect(page).to have_content("First name:")
    end

    scenario 'it allows the user to enter their last name' do
        visit('/signup')
        fill_in('last_name', with: 'Langford')
        expect(page).to have_content("Last name:")
    end

    scenario 'it allows the user to enter their password' do
        visit('/signup')
        fill_in('password', with: 'password')
        expect(page).to have_content("Password:")
    end

    scenario 'it allows the user to confirm their password' do
        visit('/signup')
        fill_in('confirm_password', with: 'password')
        expect(page).to have_content("Confirm Password:")
    end

    scenario 'it allows the user to submit their information' do
        visit('/signup')
        expect(page).to have_selector(:link_or_button, 'signup')
    end

    scenario 'should show an error message if email exists' do
      Database_connection.query(("INSERT INTO users (email, first_name, last_name,
      password) VALUES ('some_email@hotmail.com', 'Tristan', 'Langford', 'password');"))

      visit('/signup')
      fill_in('email', with: 'some_email@hotmail.com')
      fill_in('first_name', with: 'Tristan')
      fill_in('last_name', with: 'Langford')
      fill_in('password', with: 'password')
      fill_in('confirm_password', with: 'password')
      click_on('signup')
      expect(page).to have_content("An account already exists with this email address.")
    end
end
