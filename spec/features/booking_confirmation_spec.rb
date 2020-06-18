require_relative '../web_helper'

feature 'allow property owner to see booking requests' do
  scenario 'has a page to view booking requests' do
    signin_user
    visit('/view_bookings')
    click_button('Booking Requests')
    expect(page).to have_content ('Booking Requests')   
  end
end
