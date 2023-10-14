require 'rails_helper'

RSpec.describe "instrument builders show page", type: :feature do
  before (:each) do 
    @fender = InstrumentBuilder.create!(name: "Fender", year_founded: 1946, in_business: true)
    @gibson = InstrumentBuilder.create!(name: "Gibson", year_founded: 1902, in_business: true)
    @martin = InstrumentBuilder.create!(name: "Martin", year_founded: 1833, in_business: true)
  end

  it 'can see the attributes' do
    # As a visitor
    # When I visit '/parents/:id'
    visit "/instrument_builders/#{@fender.id}"
    # Then I see the parent with that id including the parent's attributes
    expect(page).to have_content(@fender.id)
    expect(page).to have_content(@fender.year_founded)
    expect(page).to have_content(@fender.name)
    expect(page).to have_content(@fender.in_business)
    expect(page).to_not have_content(@martin.name)
    expect(page).to_not have_content(@gibson.id)
    
    visit "/instrument_builders/#{@gibson.id}"
    
    expect(page).to have_content(@gibson.id)
    expect(page).to have_content(@gibson.year_founded)
    expect(page).to have_content(@gibson.name)
    expect(page).to have_content(@gibson.in_business)
    expect(page).to_not have_content(@martin.name)
  end
end