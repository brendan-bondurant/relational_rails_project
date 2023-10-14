class Model < ApplicationRecord
  belongs_to :instrument_builder
  validates_presence_of :name
  validates_presence_of :value
  validates_presence_of :year
end
