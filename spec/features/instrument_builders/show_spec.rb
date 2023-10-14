require 'rails_helper'

RSpec.describe "instrument builders show page", type: :feature do
  before (:each) do 
    @fender = InstrumentBuilder.create!(name: "Fender", year_founded: 1946, in_business: true)
    @gibson = InstrumentBuilder.create!(name: "Gibson", year_founded: 1902, in_business: true)
    @martin = InstrumentBuilder.create!(name: "Martin", year_founded: 1833, in_business: true)
    @player_tele = @fender.models.create!(name: "Player Telecaster", year: 2023, vintage: false, value: 849.99)
    @vintage_tele = @fender.models.create!(name: "Vintage Telecaster", year: 1952, vintage: true, value: 55000.00)
    @ooo15m = @martin.models.create!(name: "000-15M", year: 2023, vintage: false, value: 1699.00)
    @hateful8 = @martin.models.create!(name: "Hateful 8", year: 1870, vintage: true, value: 40000.00)
    @es339 = @gibson.models.create!(name: "ES-339", year: 2023, vintage: false, value: 2999.00)
    @vintage_lp = @gibson.models.create!(name: "Les Paul", year: 1959, vintage: true, value: 375000.00)
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


#   As a visitor
    it 'tells how many models each builder has' do
      # When I visit a parent's show page
      visit "/instrument_builders/#{@fender.id}"
      # I see a count of the number of children associated with this parent
      save_and_open_page
      expect(instrument_builder.models.count).to (2)
    
    end
end