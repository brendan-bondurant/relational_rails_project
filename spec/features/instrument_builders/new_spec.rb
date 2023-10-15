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
end
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.