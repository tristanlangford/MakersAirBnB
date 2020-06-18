feature 'READ' do
  scenario 'It should list a users properties on a My Properties page' do
    signin_user
    add_house
    click_button('My Properties')
    expect(page).to have_content('test house')
    expect(page).to have_content('Testing for two listings')
  end
end