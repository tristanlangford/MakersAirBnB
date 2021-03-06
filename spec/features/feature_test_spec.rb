require_relative '../web_helper'

feature Makers_bnb do


    scenario 'has a price for each property' do
      Database_connection.query(("INSERT INTO properties VALUES (1, 'house 1', 'top house' ,'100' );"))
      signin_user
      visit('/view_properties')
      expect(page).to have_content('/night')
    end

    scenario 'has a description for each property' do
      Database_connection.query(("INSERT INTO properties VALUES (1, 'house 1', 'top house' ,'100' );"))
      signin_user
      visit('/view_properties')
      expect(page).to have_content('Description')
    end
    
  end

  feature('allows a property owner to list a new space') do
    scenario 'It has a separate page for listing a new space' do 
      signin_user
      visit('/list_space')
      expect(page).to have_content('List a property')
    end

    scenario 'It allows a property owner to input info on new space' do
      signin_user
      visit('/list_space')
      expect(page).to have_field('name')
      expect(page).to have_field('price')
      expect(page).to have_field('description')
    end

    scenario 'Listed properties show up on properties.erb' do
      signin_user
      visit('/list_space')
      fill_in 'name', with: 'party house'
      fill_in 'price', with: '80'
      fill_in 'description', with: 'This is a description'
      fill_in "start_date", with: "2020-01-01"
      fill_in "end_date", with: "2020-10-01"
      click_button('List Property')
      expect(page).to have_content('Party house')
      expect(page).to have_content('80')
      expect(page).to have_content('This is a description')
    end
  end

  feature('Request a stay') do
    scenario 'each property renders with a button to request a stay' do
      signin_user
      visit('/list_space') 
      fill_in 'name', with: 'party house'
      fill_in 'price', with: '80'
      fill_in "start_date", with: "2020-01-01"
      fill_in "end_date", with: "2020-10-01"
      fill_in 'description', with: 'This is a description'
      click_button('List Property')
      click_button('Request a stay')
      expect(page).to have_field('comments')
    end

    scenario 'each property renders with a button to request a stay' do
      signin_user
      visit('/list_space') 
      fill_in 'name', with: 'party house'
      fill_in 'price', with: '80'
      fill_in 'description', with: 'This is a description'
      fill_in "start_date", with: "2020-01-01"
      fill_in "end_date", with: "2020-10-01"
      click_button('List Property')
      click_button('Request a stay')
      expect(page).to have_content('01/01/2020')
      expect(page).to have_content('01/10/2020')
    end
  end

