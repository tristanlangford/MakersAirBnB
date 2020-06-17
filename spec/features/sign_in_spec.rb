feature 'sign_in' do 

    scenario 'user can enter email address'do 
        visit('/sign_in')
        expect(page).to have_content("Email:")
    end

    scenario 'user can enter password'do 
    visit('/sign_in')
    expect(page).to have_content("Password:")
    end

    scenario 'users can click on sign up and it goes to /sign up'do 
    visit('/sign_in')
    click_on('sign_up')
    expect(page).to have_content("First name:")
    end

    feature 'sign_in_checks' do 

        scenario 'email not in database' do 
            visit('/sign_in')
            fill_in('email', with: 'some_email@hotmail.com')
            fill_in('password', with: 'password')
            click_on('sign_in')
            expect(page).to have_content("Email incorrect.")
        end

        scenario 'email not in database' do 
            Database_connection.query(("INSERT INTO users (email, first_name, last_name,
                password) VALUES ('some_email@hotmail.com', 'Tristan', 'Langford', 'password');"))
            visit('/sign_in')
            fill_in('email', with: 'some_email@hotmail.com')
            fill_in('password', with: 'password1')
            click_on('sign_in')
            expect(page).to have_content("Password incorrect.")
        end

        scenario 'email not in database' do 
            Database_connection.query(("INSERT INTO users (email, first_name, last_name,
                password) VALUES ('some_email@hotmail.com', 'Tristan', 'Langford', 'password');"))
            visit('/sign_in')
            fill_in('email', with: 'some_email@hotmail.com')
            fill_in('password', with: 'password')
            click_on('sign_in')
            expect(page).to have_content("Available Properties")
        end

    end

end