# frozen_string_literal: true

# model Company: multi-tenant pattern
class Company < ApplicationRecord
  has_many :cities
  validates :description, presence: true
  validates :email, uniqueness: true
end
