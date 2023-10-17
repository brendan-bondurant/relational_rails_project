require 'rails_helper'

RSpec.describe 'destroy a model' do
  it 'can delete a model from the show page' do 
    taylor = InstrumentBuilder.create!(name: "Taylor", year_founded: 1974, in_business: true)
    baby_taylor = taylor.models.create!(name: "Baby Taylor", year: 2023, vintage: false, value: 399.99)
    visit "/models/#{baby_taylor.id}"
    click_link "Delete"
    expect(current_path).to eq("/models")
    expect(page).to_not have_content("Baby Taylor")
  end
end

# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child