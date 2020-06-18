require_relative '../web_helper'
require 'pg'

feature 'allow property owner to see booking requests' do
  scenario 'has a page to view booking requests' do
    signin_user
    visit('/view_properties')
    click_button('Booking Requests')
    expect(page).to have_content ('Booking Requests')
  end

  scenario 'allows the user to confirm a booking with confirm button' do
    visit('/booking_requests')
    expect(page).to have_selector(:link_or_button, 'Confirm')
  end

  scenario 'allows the user to see any booking requests they have' do
    signin_user
    add_house

    connection = PG.connect :dbname => 'makers_bnb_test'

    connection.exec("INSERT INTO bookings(start_date, end_date, comments, booker_id, property_id")
    visit('/view_properties')
  end
end
