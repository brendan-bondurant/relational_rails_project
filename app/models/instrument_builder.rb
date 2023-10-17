class InstrumentBuilder < ApplicationRecord
  has_many :models, dependent: :destroy
  
  validates_presence_of :name
  validates_presence_of :year_founded
  
  def sort
    self.models.order(name: :asc)
  end

  def value(worth)
    self.models.where("value > ?", worth)
  end
end
