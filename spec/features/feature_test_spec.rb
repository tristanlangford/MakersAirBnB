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
    scenario 'It has a separate page for listing a new space' do 
      visit('/list_space')
      expect(page).to have_content('List a property')
    end

    scenario 'It allows a property owner to input info on new space' do
      visit('/list_space')
      expect(page).to have_field('name')
      expect(page).to have_field('price')
      expect(page).to have_field('description')
    end

    scenario 'Listed properties show up on properties.erb' do
      visit('/list_space')
      fill_in 'name', with: 'party house'
      fill_in 'price', with: '80'
      fill_in 'description', with: 'This is a description'
      click_button('List Property')
      expect(page).to have_content('party house')
      expect(page).to have_content('80')
      expect(page).to have_content('This is a description')
    end
  end

  feature('Request a stay') do
    scenario 'each property renders with a button to request a stay' do
    visit('/list_space') 
      fill_in 'name', with: 'party house'
      fill_in 'price', with: '80'
      fill_in 'description', with: 'This is a description'
      click_button('List Property')
      expect(page).to have_button('Request a stay')
    end
  end
end
