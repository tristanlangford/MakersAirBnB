feature 'sign_in' do 

    scenario 'user can enter email address'do 
        visit('/sign_in')
        expect(page).to have_content("Email:")
    end

    scenario 'user can enter password'do 
    visit('/sign_in')
    expect(page).to have_content("Password:")
    end

end