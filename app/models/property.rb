class Property < ApplicationRecord
  validates :property_address, presence: true
  validates :properties_type, presence: true
  validates :number_of_bedrooms, presence: true
  validates :number_of_sitting_rooms, presence: true
  validates :number_of_kitchen, presence: true
  validates :number_of_bathrooms, presence: true
  validates :number_of_toilets, presence: true
  validates :property_owner, presence: true, length: {maximum: 50}
  validates :description, presence: true
  validates :valid_from, presence: true
  validates :valid_to, presence: true
end
