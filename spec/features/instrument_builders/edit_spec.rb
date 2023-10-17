require 'rails_helper'

RSpec.describe 'the builder edit' do
  it 'links to edit page' do
    builder = InstrumentBuilder.create!(name: "Paul Reed Smith", year_founded: 1985, in_business: true)
    # When I visit a parent show page
    # Then I see a link to update the parent "Update Parent"
    visit "/instrument_builders/#{builder.id}"

    click_button "Edit #{builder.name}"
    # When I click the link "Update Parent"
    # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:

    expect(current_path).to eq("/instrument_builders/#{builder.id}/edit")

  end
  
  it 'can edit the builder info' do
    builder = InstrumentBuilder.create!(name: "Paul Reed Smit", year_founded: 1785, in_business: true)

    visit "/instrument_builders/#{builder.id}"
# save_and_open_page
    expect(page).to have_content("Paul Reed Smit")

    click_button "Edit #{builder.name}"

    fill_in("Name", with: "Paul Reed Smith")
    fill_in("year_founded", with: 1985)
    fill_in("in_business", with: true)
    click_button "Update"
    expect(current_path).to eq('/instrument_builders')
    expect(page).to have_content("Paul Reed Smith")
    # When I fill out the form with updated information
    # And I click the button to submit the form
    # Then a `PATCH` request is sent to '/parents/:id',
    # the parent's info is updated,
    # and I am redirected to the Parent's Show page where I see the parent's updated info
  end
end