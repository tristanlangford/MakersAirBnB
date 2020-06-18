def signin_user
    visit('/sign_in')
    fill_in('email', with: 'some_email@hotmail.com')
    fill_in('password', with: 'password')
    click_on('sign_in')
end

def add_house
    visit('/list_space')
    fill_in 'name', with: 'test house'
    fill_in 'price', with: '80'
    fill_in 'description', with: 'This is a description'
    click_button('List Property')
    visit('/list_space')
    fill_in 'name', with: 'second house'
    fill_in 'price', with: '150'
    fill_in 'description', with: 'Testing for two listings'
    click_button('List Property')
end