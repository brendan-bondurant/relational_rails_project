require 'rails_helper'

RSpec.describe 'instrument_builders index page', type: :feature do
  before (:each) do
    @fender = InstrumentBuilder.create!(name: "Fender", year_founded: 1946, in_business: true)
    @martin = InstrumentBuilder.create!(name: "Martin", year_founded: 1833, in_business: true)
    @gibson = InstrumentBuilder.create!(name: "Gibson", year_founded: 1902, in_business: true)
  end
  #   For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
  it 'can see the name of each builder' do
    # require 'pry'; binding.pry
    visit "/instrument_builders"
    expect(page).to have_content(@fender.name)
    expect(page).to have_content(@martin.name)
    expect(page).to have_content(@gibson.name)
  end
end