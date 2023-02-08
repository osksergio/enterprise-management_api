# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company::ShowCompany do
  let(:company) {
    Company.create(description: 'Description Company', email: 'test@example.com', password: 'password')
  }

  it 'return record company' do
    service = Company::ShowCompany.call(company[:id])
    expect(service.present?).to be_truthy
  end
end
