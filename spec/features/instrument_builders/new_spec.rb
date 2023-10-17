require 'rails_helper'

RSpec.describe 'Builder Creation' do
  it 'links to the new page from builder index' do
    visit '/instrument_builders'
    click_link('New Builder')
    expect(current_path).to eq("/instrument_builders/new")
  end

  it 'can create a new model' do
    visit '/instrument_builders/new'
    fill_in("Name", with: "Paul Reed Smith")
    fill_in("year_founded", with: 1985)
    fill_in("in_business", with: true)
    click_button("Create Model")
    expect(current_path).to eq("/instrument_builders")
    expect(page).to have_content("Paul Reed Smith")
  end
end