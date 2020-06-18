require_relative '../web_helper'

feature 'READ' do
  scenario 'It should list a users properties on a My Properties page' do
    signin_user
    add_house
    click_button('My Properties')
    expect(page).to have_content('test house')
    expect(page).to have_content('Testing for two listings')
  end

  scenario 'It should delete a property' do
    signin_user
    add_house
    click_button('My Properties')
    first('#property').click_on('delete')
    expect(page).not_to have_content('test house')
    expect(page).to have_content('Testing for two listings')
  end
end