class InstrumentBuilder < ApplicationRecord
  has_many :models
  
  validates_presence_of :name
  validates_presence_of :year_founded

end
