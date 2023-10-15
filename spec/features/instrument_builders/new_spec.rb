require 'rails_helper'

RSpec.describe 'Builder Creation' do
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
  it 'links to the new page from builder index' do
    visit '/instrument_builders'
    # When I click this link
    # Then I am taken to '/parents/new' where I  see a form for a new parent record
    click_link('New Builder')
    expect(current_path).to eq("/instrument_builders/new")
  end

  it 'can create a new model' do
    visit '/instrument_builders/new'
    # When I fill out the form with a new parent's attributes:
    # And I click the button "Create Parent" to submit the form
    fill_in("Name", with: "Paul Reed Smith")
    fill_in("year_founded", with: 1985)
    fill_in("in_business", with: true)
    click_button("Create Model")
    # Then a `POST` request is sent to the '/parents' route,
    # a new parent record is created,
    # and I am redirected to the Parent Index page where I see the new Parent displayed.
    new_builder_id = InstrumentBuilder.last.id
    expect(current_path).to eq("/instrument_builders")
    expect(page).to have_content("Paul Reed Smith")
  
  end
end