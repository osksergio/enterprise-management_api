# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :company
  validates :description, presence: true
  validates :state, presence: true
end
