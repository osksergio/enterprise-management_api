require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'Create Company' do
    new_company = Company.create(description: "Description", email: "foo@bar.com", password: "password")
    expect(new_company.description).to eq("Description")
  end

  describe 'Required validations' do
    it { should validate_presence_of(:description) }
    it { should validate_uniqueness_of(:email) }
  end

  it 'Delete Company' do
    new_company = Company.create(description: "Description", email: "foo@bar.com", password: "password")
    new_company.destroy
    expect{ new_company.reload }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
