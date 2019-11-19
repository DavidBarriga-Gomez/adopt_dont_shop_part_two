require 'rails_helper'

RSpec.describe 'As a visitor when I visit /shelters', type: :feature do
  before(:each) do
    @raccoon_shelter = Shelter.create(name: 'Raccoon Shelter', address: 'Raccoon Road', city: 'Raccoon State', state: 'Raccoon City', zip: '80237')
    @dog_shelter = Shelter.create(name: 'Dog Shelter', address: 'Dog Road', city: 'Dog City', state: 'Dog State', zip: '80238')
    @cat_shelter = Shelter.create(name: 'Cat Shelter', address: 'Cat Road', city: 'Cat City', state: 'Cat State', zip: '80239')
  end

  it 'shows the name of each shelter in the system' do
    visit '/shelters'

    expect(page).to have_content(@raccoon_shelter.name)
    expect(page).to have_content(@dog_shelter.name)
    expect(page).to have_content(@cat_shelter.name)
  end
end
