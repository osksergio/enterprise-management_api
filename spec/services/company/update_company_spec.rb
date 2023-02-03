# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company::UpdateCompany do
  let(:company) { Company.create(description: 'old_description', email: 'old_email', password: 'old_password') }

  let(:params) {
    {
      id: company.id,
      description: 'Silva & Silva Company Inc.',
      email: 'novo_email@silva.com',
      password: '5555'
    }
  }

  context 'modify company data' do
    it 'change company e-mail' do
      service = Company::UpdateCompany.call(params)
      company.reload

      expect(service).to be_truthy
      expect(company.description).to eq('Silva & Silva Company Inc.')
      expect(company.email).to eq('novo_email@silva.com')
      expect(company.password).to eq('5555')
    end
  end
end
