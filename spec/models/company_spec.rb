# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'Create Company' do
    new_company = Company.create(description: 'Description', email: 'foo@bar.com', password: 'password')
    expect(new_company.description).to eq('Description')
  end

  describe 'Required validations' do
    it { should validate_presence_of(:description) }
    it { should validate_uniqueness_of(:email) }
  end

  it 'Update Company' do
    new_company = Company.create(description: 'Description', email: 'foo@bar.com', password: 'password')
    new_company.update(description: 'New Description', email: 'new_email@bar.com', password: 'new_password')
    expect(new_company.description).to eq('New Description')
    expect(new_company.email).to eq('new_email@bar.com')
    expect(new_company.password).to eq('new_password')
  end

  it 'Delete Company' do
    new_company = Company.create(description: 'Description', email: 'foo@bar.com', password: 'password')
    new_company.destroy
    expect { new_company.reload }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
