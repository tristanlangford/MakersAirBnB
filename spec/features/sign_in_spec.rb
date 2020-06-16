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

end