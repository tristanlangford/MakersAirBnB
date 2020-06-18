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

  scenario 'It should go to new page for edit a property' do
    signin_user
    add_house
    click_button('My Properties')
    first('#property').click_on('edit')
    expect(page).to have_field('name')
    expect(page).to have_field('price')
    expect(page).to have_field('description')
  end

  scenario 'It should edit a property' do
    signin_user
    add_house
    click_button('My Properties')
    first('#property').click_on('edit')
    fill_in 'name', with: 'party house'
    fill_in 'price', with: '80'
    fill_in 'description', with: 'This is a description'
    click_button('edit')
    expect(page).to have_content('party house')
    expect(page).to have_content('80')
    expect(page).to have_content('This is a description')
  end
end