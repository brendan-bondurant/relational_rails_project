require 'rails_helper'

RSpec.describe "models show page", type: :feature do
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
    visit "/models/#{@es339.id}"
    expect(page).to have_content(@es339.id)
    expect(page).to have_content(@es339.year)
    expect(page).to have_content(@es339.value)
    expect(page).to have_content(@es339.vintage)
    expect(page).to_not have_content(@hateful8.name)
    expect(page).to_not have_content(@vintage_lp.id)
    visit "/models/#{@ooo15m.id}"
    expect(page).to have_content(@ooo15m.id)
    expect(page).to have_content(@ooo15m.year)
    expect(page).to have_content(@ooo15m.name)
    expect(page).to have_content(@ooo15m.vintage)
    expect(page).to_not have_content(@player_tele.name)
  end

  it 'has an edit button next to each entry' do
    visit "/models"
    click_link "Edit #{@vintage_lp.name}"
    expect(current_path).to eq("/models/#{@vintage_lp.id}/edit")
  end
end