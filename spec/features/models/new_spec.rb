require 'rails_helper'

RSpec.describe 'create a new model' do
before (:each) do
  @prs = InstrumentBuilder.create!(name: "Paul Reed Smith", year_founded: 1985, in_business: true)
  @dgt = @prs.models.create!(name: "DGT", year: 2023, vintage: false, value: 4600.00)
end

  it 'links to the new page from model index' do 
    visit "/instrument_builders/#{@prs.id}/models"
    click_link("New Model")
    expect(current_path).to eq("/instrument_builders/#{@prs.id}/models/new")
    fill_in('Name', with: "McCarty 594")
    fill_in('Year', with: 2023)
    fill_in('Vintage', with: false)
    fill_in('Value', with: 4660.00)
    click_button('Create Model')
    expect(current_path).to eq("/instrument_builders/#{@prs.id}/models")
    expect(page).to have_content("McCarty 594")
  end
end