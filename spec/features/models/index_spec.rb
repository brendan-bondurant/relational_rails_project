require 'rails_helper'

RSpec.describe "models index page", type: :feature do
  before (:each) do 
  @fender = InstrumentBuilder.create!(name: "Fender", year_founded: 1946, in_business: true)
  @player_tele = @fender.models.create!(name: "Player Telecaster", year: 2023, vintage: false, value: 849.99)
  @vintage_tele = @fender.models.create!(name: "Vintage Telecaster", year: 1952, vintage: true, value: 55000.00)
  @martin = InstrumentBuilder.create!(name: "Martin", year_founded: 1833, in_business: true)
  @ooo15m = @martin.models.create!(name: "000-15M", year: 2023, vintage: false, value: 1699.00)
  @hateful8 = @martin.models.create!(name: "Hateful 8", year: 1870, vintage: true, value: 40000.00)
  @prs = InstrumentBuilder.create!(name: "Paul Reed Smith", year_founded: 1985, in_business: true)
  @gibson = InstrumentBuilder.create!(name: "Gibson", year_founded: 1902, in_business: true)
  @es339 = @gibson.models.create!(name: "ES-339", year: 2023, vintage: false, value: 2999.00)
  @vintage_lp = @gibson.models.create!(name: "Les Paul", year: 1959, vintage: true, value: 375000.00)
  @dgt = @prs.models.create!(name: "DGT", year: 2023, vintage: false, value: 4600.00)
  
  end
  
  it 'displays each model with attributes' do
    # When I visit '/child_table_name'
    visit "/models"
    # Then I see each Child in the system including the Child's attributes
    expect(page).to_not have_content(@player_tele.name)
    #the above test was changed from to have_content for user story 15
    expect(page).to have_content(@vintage_tele.year)
    expect(page).to_not have_content(@ooo15m.vintage)
    #the above test was changed from to have_content for user story 15
    expect(page).to have_content(@vintage_tele.value)
    # (data from each column that is on the child table)
  end

  it 'can be accessed from anywhere' do
#     As a visitor
# When I visit any page on the site
    visit "/instrument_builders"
    # Then I see a link at the top of the page that takes me to the Child Index
    expect(page).to have_link("Models Index")
    visit "/instrument_builders/#{@fender.id}"
    expect(page).to have_link("Models Index")
    visit "/instrument_builders/#{@martin.id}/models"
    expect(page).to have_link("Models Index")
    visit "/models/#{@player_tele.id}"
    expect(page).to have_link("Models Index")
  end

  it 'is at the top of the page' do
    visit "/instrument_builders"
    expect("Models Index").to appear_before("Builder")
    visit "/instrument_builders/#{@fender.id}"
    expect("Models Index").to appear_before("Builder")
    visit "/instrument_builders/#{@martin.id}/models"
    expect("Models Index").to appear_before("Name")
    visit "/models/#{@player_tele.id}"
    expect("Models Index").to appear_before("Name")
  
  end

  it 'shows only records where the boolean column is true' do
#     As a visitor
# When I visit the child index
    visit "/models"
save_and_open_page
# Then I only see records where the boolean column is `true`
expect(page).to have_content(@vintage_tele.name)
expect(page).to have_content(@vintage_lp.name)
expect(page).to have_content(@hateful8.name)
expect(page).to_not have_content(@dgt.name)
  
  end
end