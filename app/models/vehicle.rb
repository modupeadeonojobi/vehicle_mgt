class Vehicle < ApplicationRecord
  belongs_to :user 
  belongs_to :state, class_name: 'State', foreign_key: 'state_id'
end
