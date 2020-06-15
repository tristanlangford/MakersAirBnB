feature Makers_bnb do 
  scenario 'it loads with Makers Bnb on the home page' do
    visit('/')
    expect(page).to have_content('Makers BnB')
  end
end