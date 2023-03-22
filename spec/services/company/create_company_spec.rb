# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Companies::CreateCompany do
  let(:params) do
    {
      description: 'Silva & Silva Company Inc.',
      email: 'silva@silva.com',
      password: '123456'
    }
  end

  context 'When created company with valid parameters' do
    it 'return  true' do
      service = Companies::CreateCompany.call(params)
      expect(service).to be_truthy
    end
  end

  context 'When created company with invalid parameters' do
    it 'return errors' do
      service = Companies::CreateCompany.call({ description: '' })
      expect(service.errors).not_to be_nil
    end
  end
end
