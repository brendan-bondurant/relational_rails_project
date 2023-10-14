require 'rails_helper'

RSpec.describe InstrumentBuilder, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :year_founded }
    it { should allow_value(true).for(:in_business) }
    it { should allow_value(false).for(:in_business) }
  end

  describe 'relationships' do
    it { should have_many :models}
  end
end
