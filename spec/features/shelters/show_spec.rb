require 'rails_helper'

RSpec.describe 'As a visitor when I visit /shelters/:id', type: :feature do
  before(:each) do
    @raccoon_shelter = Shelter.create!(name: 'Raccoon Shelter', address: 'Raccoon Road', city: 'Raccoon State', state: 'Raccoon City', zip: '80237')
    @dog_shelter = Shelter.create(name: 'Dog Shelter', address: 'Dog Road', city: 'Dog City', state: 'Dog State', zip: '80238')
    @cat_shelter = Shelter.create(name: 'Cat Shelter', address: 'Cat Road', city: 'Cat City', state: 'Cat State', zip: '80239')
  end

  it 'can view all shelter information' do
    visit "/shelters/#{@raccoon_shelter.id}"

    expect(page).to have_content(@raccoon_shelter.name)
    expect(page).to have_content("Address: #{@raccoon_shelter.address}")
    expect(page).to have_content("City: #{@raccoon_shelter.city}")
    expect(page).to have_content("State: #{@raccoon_shelter.state}")
    expect(page).to have_content("Zip: #{@raccoon_shelter.zip}")

    visit "/shelters/#{@dog_shelter.id}"

    expect(page).to have_content(@dog_shelter.name)
    expect(page).to have_content("Address: #{@dog_shelter.address}")
    expect(page).to have_content("City: #{@dog_shelter.city}")
    expect(page).to have_content("State: #{@dog_shelter.state}")
    expect(page).to have_content("Zip: #{@dog_shelter.zip}")
  end
end
