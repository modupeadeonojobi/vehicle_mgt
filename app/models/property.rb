class Property < ApplicationRecord
  validates :property_address, :property_type, presence: true
  validates :number_of_bedrooms, :number_of_sitting_rooms, :number_of_kitchens, :number_of_bathrooms, :number_of_toilets, presence: true, length: {maximum: 3}
  validates :property_owner, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}
  validates :valid_from, :valid_to, presence: true
  validates :valid_to, comparison: { greater_than: :valid_from }

  enum property_type: { flat: 0, house: 1, cabin: 2, condos: 3, ranch: 4, apartment: 5 }

 
end
