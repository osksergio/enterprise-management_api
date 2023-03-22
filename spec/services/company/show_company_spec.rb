# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Companies::ShowCompany do
  let(:company) do
    Company.create(description: 'Description Company', email: 'test@example.com', password: 'password')
  end

  it 'return record company' do
    service = Companies::ShowCompany.call(company[:id])
    expect(service.present?).to be_truthy
  end
end
