# frozen_literal_string: true

require 'rails_helper'

RSpec.describe Cities::CreateCity do
  let(:params) do
    {
      description: 'San Diego',
      state: 'CA',
      company_id: '1'
    }
  end

  context 'When created city with valid parameters' do
    it 'return true' do
      service = Cities::CreateCity.call(params)
      expect(service).to be_truthy
    end
  end

end
