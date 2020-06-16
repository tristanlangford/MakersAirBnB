feature 'signup' do 

    scenario 'it allows the user to enter their email address' do 
        visit('/signup')
        expect(page).to have_content("Email:")
    end


end