class Spot < ApplicationRecord
  belongs_to :user
  
  enum weather: { sunny: 0, rainy: 1 }
  
  validates :name, presence: true
  validates :address, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode
end
