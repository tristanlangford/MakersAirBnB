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

  feature('allows a property owner to list a new space') do
    scenario 'It has a seperate page for listing a new space' do 
      visit('/list_space')
      expect(page).to have_content('List a property')
    end

    scenario 'It allows a property owner to input info on new space' do
      visit('/list_space')
      expect(page).to have_field('name')
      expect(page).to have_field('price')
      expect(page).to have_field('description')
    end
  end
end
