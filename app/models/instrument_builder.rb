class InstrumentBuilder < ApplicationRecord
  has_many :models, dependent: :destroy
  
  validates_presence_of :name
  validates_presence_of :year_founded
  

end
