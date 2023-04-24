# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  it 'Create City' do
  	new_city = City.create(description: 'Description', state: 'SP', company_id: "1")
  	expect(new_city.description).to eq('Description')
  end
end
