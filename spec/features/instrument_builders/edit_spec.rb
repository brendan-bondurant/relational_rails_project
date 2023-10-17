require 'rails_helper'

RSpec.describe 'the builder edit' do
  it 'links to edit page' do
    builder = InstrumentBuilder.create!(name: "Paul Reed Smith", year_founded: 1985, in_business: true)
    visit "/instrument_builders/#{builder.id}"
    click_link "Edit #{builder.name}"
    expect(current_path).to eq("/instrument_builders/#{builder.id}/edit")
  end
  
  it 'can edit the builder info' do
    builder = InstrumentBuilder.create!(name: "Paul Reed Smit", year_founded: 1785, in_business: true)
    visit "/instrument_builders/#{builder.id}"
    expect(page).to have_content("Paul Reed Smit")
    click_link "Edit #{builder.name}"
    fill_in("Name", with: "Paul Reed Smith")
    fill_in("year_founded", with: 1985)
    fill_in("in_business", with: true)
    click_button "Update"
    expect(current_path).to eq('/instrument_builders')
    expect(page).to have_content("Paul Reed Smith")
  end
end