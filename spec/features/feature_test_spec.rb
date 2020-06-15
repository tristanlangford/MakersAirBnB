feature Makers_bnb do
  scenario 'It loads with Makers Bnb on the home page' do
    visit('/')
    expect(page).to have_content('Makers BnB')
  end

  feature('View Listings') do
    scenario 'It has a separate page to view currently listed properties' do
      visit('/')
      click_button('View Properties')
      expect(page).to have_content('Available Properties')
    end

    scenario 'has a title for each property' do
      visit('/view_properties')
      expect(page).to have_content('Title')
    end
  end
end
