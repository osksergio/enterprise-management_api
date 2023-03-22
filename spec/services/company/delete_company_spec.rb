# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Companies::DeleteCompany do
  let(:company) do
    Company.create(description: 'Description Company', email: 'company@domain.com', password: 'password')
  end

  context 'Delete the company' do
    it 'Delete company successfully' do
      service = Companies::DeleteCompany.call(company[:id])
      expect { service }.to change { Company.count }.by 0
      expect { company.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
