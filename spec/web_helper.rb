def signin_user
    visit('/sign_in')
    fill_in('email', with: 'some_email@hotmail.com')
    fill_in('password', with: 'password')
    click_on('sign_in')
end