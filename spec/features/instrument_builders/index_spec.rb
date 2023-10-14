require 'rails_helper'

RSpec.describe 'instrument_builders index page', type: :feature do
  before (:each) do
    @fender = InstrumentBuilder.create!(name: "Fender", year_founded: 1946, in_business: true)
    @martin = InstrumentBuilder.create!(name: "Martin", year_founded: 1833, in_business: true)
    @gibson = InstrumentBuilder.create!(name: "Gibson", year_founded: 1902, in_business: true)
    @player_tele = @fender.models.create!(name: "Player Telecaster", year: 2023, vintage: false, value: 849.99)
    @vintage_tele = @fender.models.create!(name: "Vintage Telecaster", year: 1952, vintage: true, value: 55000.00)
    @ooo15m = @martin.models.create!(name: "000-15M", year: 2023, vintage: false, value: 1699.00)
    @hateful8 = @martin.models.create!(name: "Hateful 8", year: 1870, vintage: true, value: 40000.00)
    @es339 = @gibson.models.create!(name: "ES-339", year: 2023, vintage: false, value: 2999.00)
    @vintage_lp = @gibson.models.create!(name: "Les Paul", year: 1959, vintage: true, value: 375000.00)
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
  
  it 'shows all the models with a specific builder' do

    # When I visit '/parents/:parent_id/child_table_name'
    # require 'pry'; binding.pry
    visit "/instrument_builders/#{@fender.id}/models"
    # Then I see each Child that is associated with that Parent with each Child's attributes
    expect(page).to have_content(@vintage_tele.name)
    expect(page).to have_content(@player_tele.name)
    expect(page).to have_content(@vintage_tele.year)
    expect(page).to have_content(@player_tele.year)
    expect(page).to have_content(@vintage_tele.vintage)
    expect(page).to have_content(@player_tele.vintage)
    expect(page).to have_content(@vintage_tele.value)
    expect(page).to have_content(@player_tele.value)
    expect(page).to_not have_content(@ooo15m.value)
    expect(page).to_not have_content(@vintage_lp.name)
    # (data from each column that is on the child table)
    # end
    end
  end