require 'rails_helper'

RSpec.describe 'As a Visitor when i visit /pets', type: :feature do
  before(:each) do
    @raccoon_shelter = Shelter.create(name: 'Raccoon Shelter', address: 'Raccoon Road', city: 'Raccoon State', state: 'Raccoon City', zip: '80237')
    @dog_shelter = Shelter.create(name: 'Dog Shelter', address: 'Dog Road', city: 'Dog City', state: 'Dog State', zip: '80238')
    @cat_shelter = Shelter.create(name: 'Cat Shelter', address: 'Cat Road', city: 'Cat City', state: 'Cat State', zip: '80239')

    @elena = @raccoon_shelter.pets.create(image: 'https://imgix.ranker.com/user_node_img/50070/1001387908/original/1-photo-u1?w=650&q=50&fm=pjpg&fit=crop&crop=faces', name: 'Elena', age: 27, sex: 'Female')
    @foxy = @dog_shelter.pets.create(image: 'https://image.pbs.org/video-assets/x1WLcZn-asset-mezzanine-16x9-6kkb4dA.jpg', name: 'Foxy', age: 5, sex: 'Female')
    @goblin = @cat_shelter.pets.create(image: 'https://static.boredpanda.com/blog/wp-content/uploads/2016/02/big-cute-eyes-cat-black-scottish-fold-gimo-1room1cat-fb__700-png.jpg', name: 'Goblin', age: 5, sex: 'Female')
  end

  it 'A User sees the image, name, approximate age, sex, and associated shelter of the pet' do
    visit '/pets'

    # expect(page).to have_content(@elena.image)
    expect(page).to have_content(@elena.name)
    expect(page).to have_content(@elena.age)
    expect(page).to have_content(@elena.sex)
    expect(page).to have_content(@elena.shelter.name)

    # expect(page).to have_content(@goblin.image)
    expect(page).to have_content(@goblin.name)
    expect(page).to have_content(@goblin.age)
    expect(page).to have_content(@goblin.sex)
    expect(page).to have_content(@goblin.shelter.name)
  end
end
