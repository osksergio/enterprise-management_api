class Company < ApplicationRecord
  validates :description, presence: true
  validates :email, uniqueness: true
end
