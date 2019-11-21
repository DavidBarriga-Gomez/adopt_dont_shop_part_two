require 'rails_helper'

RSpec.describe 'As a User', type: :feature do
  before(:each) do
    @raccoon_shelter = Shelter.create(name: 'Raccoon Shelter', address: 'Raccoon Road', city: 'Raccoon State', state: 'Raccoon City', zip: '80237')
    @dog_shelter = Shelter.create(name: 'Dog Shelter', address: 'Dog Road', city: 'Dog City', state: 'Dog State', zip: '80238')
    @cat_shelter = Shelter.create(name: 'Cat Shelter', address: 'Cat Road', city: 'Cat City', state: 'Cat State', zip: '80239')

    @elena = @raccoon_shelter.pets.create(image: 'https://imgix.ranker.com/user_node_img/50070/1001387908/original/1-photo-u1?w=650&q=50&fm=pjpg&fit=crop&crop=faces', name: 'Elena', age: 27, sex: 'Female', description: 'This raccoon likes power.', status: 'pending')
    @raccoon = @raccoon_shelter.pets.create(image: 'https://imgix.ranker.com/user_node_img/50070/1001387908/original/1-photo-u1?w=650&q=50&fm=pjpg&fit=crop&crop=faces', name: 'Racccoon', age: 5, sex: 'Male')
    @foxy = @dog_shelter.pets.create(image: 'https://image.pbs.org/video-assets/x1WLcZn-asset-mezzanine-16x9-6kkb4dA.jpg', name: 'Foxy', age: 5, sex: 'Female')
    @goblin = @cat_shelter.pets.create(image: 'https://static.boredpanda.com/blog/wp-content/uploads/2016/02/big-cute-eyes-cat-black-scottish-fold-gimo-1room1cat-fb__700-png.jpg', name: 'Goblin', age: 5, sex: 'Female')
  end

  it 'When I visit a Shelter Pets Index Page I can add a new adoptable pet' do
    visit "/shelters/#{@raccoon_shelter.id}/pets"

    expect(page).to have_link('Add New Adoptable Pet')

    click_link 'Add New Adoptable Pet'

    expect(current_path).to eq("/shelters/#{@raccoon_shelter.id}/pets/new")

    # image = 'https://image.pbs.org/video-assets/x1WLcZn-asset-mezzanine-16x9-6kkb4dA.jpg'
    name = 'Foxy'
    description = 'It does not look like a raccoon but i swear it is.'
    age = 5
    sex = 'Female'

    fill_in :image, with: "img[src*='https://image.pbs.org/video-assets/x1WLcZn-asset-mezzanine-16x9-6kkb4dA.jpg']"
    fill_in :name, with: name
    fill_in :description, with: description
    fill_in :age, with: age
    fill_in :sex, with: sex

    click_on 'Submit'

    expect(current_path).to eq("/shelters/#{@raccoon_shelter.id}/pets")

    expect(page).to have_css("img[src*='https://image.pbs.org/video-assets/x1WLcZn-asset-mezzanine-16x9-6kkb4dA.jpg']")
    expect(page).to have_content(name)
    expect(Pet.last.description).to have_content(description)
    expect(page).to have_content(age)
    expect(page).to have_content(sex)
    expect(Pet.last.status).to eq('adoptable')
    save_and_open_page
    
  end
end
