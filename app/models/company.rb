class Company < ApplicationRecord
  validates :description, presence: true
end
