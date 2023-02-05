# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company::DeleteCompany do
  let(:company) { Company.create(description: 'Description Company', email: 'company@domain.com', password: 'password') }

  context 'Delete the company' do
    it 'Delete company successfully' do
      service = Company::DeleteCompany.call(company[:id])
      expect(service).to change(Company, :count).by(-1)
    end
  end
end
