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
  
  it 'can see the name of each builder' do
    visit "/instrument_builders"
    expect(page).to have_content(@fender.name)
    expect(page).to have_content(@martin.name)
    expect(page).to have_content(@gibson.name)
  end
  
  it 'shows all the models with a specific builder' do
    visit "/instrument_builders/#{@fender.id}/models"
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
    end
  
  it 'shows builders by recently created' do
    visit "/instrument_builders"
    expect(page).to have_content(@fender.created_at)
    expect(page).to have_content(@martin.created_at)
    expect(page).to have_content(@gibson.created_at)
    expect(@fender.name).to appear_before(@martin.name)
    expect(@martin.name).to appear_before(@gibson.name)
    expect(@gibson.name).to_not appear_before(@gibson.name)
  end

  it 'can be accessed from anywhere' do
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
    visit "/instrument_builders/#{@fender.id}"
    expect(page).to have_link("Everything They Make")
  end

  it 'alphabetizes list of models' do
    z_tele = @fender.models.create!(name: "Z Telecaster", year: 2023, vintage: true, value: 849.99)
    s_tele = @fender.models.create!(name: "S Telecaster", year: 1952, vintage: true, value: 55000.00)
    visit "/instrument_builders/#{@fender.id}/models"
    expect(z_tele.name).to appear_before(s_tele.name)
    click_link "Alphabetize"
    expect(current_path).to eq("/instrument_builders/#{@fender.id}/models")
    expect(@player_tele.name).to appear_before(@vintage_tele.name)
    expect(@player_tele.name).to appear_before(z_tele.name)
    expect(s_tele.name).to appear_before(z_tele.name)
  end

  it 'has an edit link next to each parent' do
    visit "/instrument_builders"
    click_link "Edit #{@fender.name}"
    expect(current_path).to eq("/instrument_builders/#{@fender.id}/edit")
  end

  it 'has a delete link next to each parent' do
    visit "/instrument_builders"
    click_link "Delete #{@fender.name}"
  end

  it 'allows for seeing only models above a specific value' do
    visit "/instrument_builders/#{@fender.id}/models"
    expect(page).to have_content(@player_tele.name)
    expect(page).to have_content(@vintage_tele.name)
    fill_in("value", with: 1000)
    click_button "Only return records worth more than this"
    expect(current_path).to eq("/instrument_builders/#{@fender.id}/models")
    expect(page).to_not have_content(@player_tele.name)
  end
end