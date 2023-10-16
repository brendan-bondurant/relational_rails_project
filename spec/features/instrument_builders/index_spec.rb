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
  it 'shows builders by recently created' do
    #     As a visitor
    # When I visit the parent index,
    visit "/instrument_builders"
    # I see that records are ordered by most recently created first
    expect(page).to have_content(@fender.created_at)
    expect(page).to have_content(@martin.created_at)
    expect(page).to have_content(@gibson.created_at)
    # And next to each of the records I see when it was created
    expect(@fender.name).to appear_before(@martin.name)
    expect(@martin.name).to appear_before(@gibson.name)
    expect(@gibson.name).to_not appear_before(@gibson.name)
  end
  it 'can be accessed from anywhere' do
#     As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Parent Index
    visit "/instrument_builders"
    expect(page).to have_link("Builder Index")
    visit "/instrument_builders/#{@fender.id}"
    expect(page).to have_link("Builder Index")
    visit "/instrument_builders/#{@martin.id}/models"
    expect(page).to have_link("Builder Index")
    visit "/models/#{@player_tele.id}"
    expect(page).to have_link("Builder Index")
  end

  it 'is at the top of the page' do
    visit "/instrument_builders"
    expect("Builder Index").to appear_before("All")
    visit "/instrument_builders/#{@fender.id}"
    expect("Builder Index").to appear_before("Founded in")
    visit "/instrument_builders/#{@martin.id}/models"
    expect("Builder Index").to appear_before("Name")
    visit "/models/#{@player_tele.id}"
    expect("Builder Index").to appear_before("Name")
  end

  it 'connects the show page the child-table page' do
# When I visit a parent show page ('/parents/:id')
  visit "/instrument_builders/#{@fender.id}"
# Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
  expect(page).to have_link("Everything They Make")
  
  end

  it 'alphabetizes list of models' do
#     As a visitor
# When I visit the Parent's children Index Page
visit "/instrument_builders/#{@fender.id}/models"
# Then I see a link to sort children in alphabetical order
click_link "Alphabetize"

expect(current_path).to eq("/instrument_builders/#{@fender.id}/alphabetize")

expect(@player_tele.name).to appear_before(@vintage_tele.name)

# When I click on the link
# I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
  end
end