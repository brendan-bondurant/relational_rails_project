require 'rails_helper'

RSpec.describe 'destroy a builder' do
  it 'can delete the builder from index' do
    taylor = InstrumentBuilder.create!(name: "Taylor", year_founded: 1974, in_business: true)
    visit "/instrument_builders/#{taylor.id}"
    click_button 'Delete'
    expect(current_path).to eq('/instrument_builders')
    expect(page).to_not have_content("Taylor")
  end
end

# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent