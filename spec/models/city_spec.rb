# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  it 'Create City' do
    new_city = City.create(description: 'Description', state: 'SP', company_id: '1')
    expect(new_city.description).to eq('Description')
  end

  describe 'Required validations' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:state) }
  end

  it 'Update City' do
    new_city = City.create(description: 'Description', state: 'AA', company_id: '1')
    new_city.update(description: 'New Description', state: 'BB', company_id: '1')
    expect(new_city.description).to eq('New Description')
    expect(new_city.state).to eq('BB')
  end

  it 'Delete City' do
    new_city = City.create(description: 'Description', state: 'AA', company_id: '1')
    new_city.destroy
    expect { new_city.reload }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
