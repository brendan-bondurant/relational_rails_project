require 'rails_helper'

RSpec.describe 'the builder edit' do
  it 'links to edit page' do
    builder = InstrumentBuilder.create!(name: "Paul Reed Smith", year_founded: 1985, in_business: true)
    # When I visit a parent show page
    # Then I see a link to update the parent "Update Parent"
    visit '/instrument_builders'

    click_button "Edit #{builder.name}"
    # When I click the link "Update Parent"
    # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:

    expect(current_path).to eq("/instrument_builders/#{builder.id}/edit")

  end
end


# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info