# frozen_string_literal: true

FactoryBot.define do
  sequence :descriptions do |n|
    "City Name ##{n}"
  end

  factory :city do
    description { generate(:descriptions) }
    state { 'ST' }
    company { '1' }
  end
end
