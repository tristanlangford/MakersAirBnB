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

    connection = PG.connect :dbname => 'makers_bnb_test'

    connection.exec(("INSERT INTO properties (name, price, description, prop_id, user_id)
    Values ('farm', '10', 'cheep', '1', '1')"))

    connection.exec(("INSERT INTO bookings (start_date, end_date, comments, booker_id, property_id)
    VALUES ('2020-07-05', '2020-07-06', 'hello', '2', '1')"))
    signin_user
    visit('view_properties')
    click_button('Booking Requests')
    expect(page).to have_content('2020-07-05')
  end
end

    # signin_holiday_maker
    # visit('view_properties')
    # click_button('Request a stay')
    # fill_in 'start_date', with: "2020-07-05"
    # fill_in 'end_date', with: "2020-07-06"
    # click_button('Request a stay')
    # expect(page).to have_content("Available Properties")
