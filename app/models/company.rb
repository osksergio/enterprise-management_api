class Company < ApplicationRecord
  has_many :cities
  validates :description, presence: true
  validates :email, uniqueness: true
end
