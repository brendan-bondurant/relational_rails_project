require 'rails_helper'

RSpec.describe 'model edit' do
  before (:each) do
    @prs = InstrumentBuilder.create!(name: "Paul Reed Smith", year_founded: 1985, in_business: true)
    @dgt = @prs.models.create!(name: "DGT", year: 2023, vintage: false, value: 4600.00)
  end
  it 'links to the edit page' do
    visit "/models/#{@dgt.id}"
# require 'pry'; binding.pry
# save_and_open_page
    click_button "Edit"

    expect(current_path).to eq("/models/#{@dgt.id}/edit")
  
  end
end



# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information