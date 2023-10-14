require 'rails_helper'

RSpec.describe Model, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :value }
    it { should validate_presence_of :year }
    it { should allow_value(true).for(:vintage) }
    it { should allow_value(false).for(:vintage) }

  end


  describe 'relationships' do
    it {should belong_to :instrument_builder}
  
  end
end
