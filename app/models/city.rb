# frozen_literal_string: true

# entity City (Class)
class City < ApplicationRecord
  belongs_to :company
  validates :description, presence: true
  validates :state, presence: true
end
