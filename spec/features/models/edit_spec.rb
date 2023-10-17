require 'rails_helper'

RSpec.describe 'model edit' do
  before (:each) do
    @prs = InstrumentBuilder.create!(name: "Paul Reed Smith", year_founded: 1985, in_business: true)

  end
  it 'links to the edit page' do
    dgt = @prs.models.create!(name: "DGT", year: 2023, vintage: false, value: 4600.00)
    visit "/models/#{dgt.id}"
    click_link "Edit"
    expect(current_path).to eq("/models/#{dgt.id}/edit")
  end

  it 'can edit the model' do
    dgt = @prs.models.create!(name: "DOG", year: 2023, vintage: false, value: 4600.00)
    visit "/models/#{dgt.id}"
    expect(page).to have_content("DOG")
    click_link "Edit"
    visit "/models/#{dgt.id}/edit"
    fill_in "Name", with: "DGT"
    fill_in "Year", with: "2023"
    fill_in "Vintage", with: false
    fill_in "Value", with: 4600
    click_button "Update"
    expect(current_path).to eq("/models/#{dgt.id}")
    expect(page).to have_content("DGT")
  end
end

