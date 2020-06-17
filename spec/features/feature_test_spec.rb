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
      Database_connection.query(("INSERT INTO properties VALUES (1, 'house 1', 'top house' ,'100' );"))
      visit('/view_properties')
      expect(page).to have_content('Title')
    end

    scenario 'has a price for each property' do
      Database_connection.query(("INSERT INTO properties VALUES (1, 'house 1', 'top house' ,'100' );"))
      visit('/view_properties')
      expect(page).to have_content('/night')
    end

    scenario 'has a description for each property' do
      Database_connection.query(("INSERT INTO properties VALUES (1, 'house 1', 'top house' ,'100' );"))
      visit('/view_properties')
      expect(page).to have_content('Description')
    end
    
  end
end
