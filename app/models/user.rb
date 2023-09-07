class User < ApplicationRecord

  enum role: [:regular, :admin]

  has_many :vehicles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
