feature 'sign_in' do 

    scenario 'user can enter email address'do 
        visit('/')
        expect(page).to have_content("Email:")
    end

    scenario 'user can enter password'do 
    visit('/')
    expect(page).to have_content("Password:")
    end

    scenario 'users can click on sign up and it goes to /sign up'do 
    visit('/')
    click_on('sign_up')
    expect(page).to have_content("First name:")
    end

    feature 'sign_in_checks' do 

        scenario 'email not in database' do 
            visit('/')
            fill_in('email', with: 'some_email1@hotmail.com')
            fill_in('password', with: 'password')
            click_on('sign_in')
            expect(page).to have_content("Email incorrect.")
        end

        scenario 'checks if password is incorrect' do 
            Model_Makers_bnb.add_user('some_email@hotmail.com', 'Tristan', 'Langford', 'password')
            visit('/')
            fill_in('email', with: 'some_email@hotmail.com')
            fill_in('password', with: 'password1')
            click_on('sign_in')
            expect(page).to have_content("Password incorrect.")
        end

        scenario 'redirect to properties on sign in' do 
            Model_Makers_bnb.add_user('some_email@hotmail.com', 'Tristan', 'Langford', 'password')
            visit('/')
            fill_in('email', with: 'some_email@hotmail.com')
            fill_in('password', with: 'password')
            click_on('sign_in')
            expect(page).to have_content("Available Properties")
        end

        scenario 'page should have users name' do 
            Model_Makers_bnb.add_user('some_email@hotmail.com', 'Tristan', 'Langford', 'password')
            visit('/')
            fill_in('email', with: 'some_email@hotmail.com')
            fill_in('password', with: 'password')
            click_on('sign_in')
            expect(page).to have_content("Tristan")
        end

    end

end