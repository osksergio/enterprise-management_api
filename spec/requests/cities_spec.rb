# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/cities', type: :request do
  let(:valid_attributes) {
    {
      description: "City description",
      state: "ST",
      company_id: 1
    }
  }

  let(:invalid_attributes) do
    {
      description: '',
      state: '',
      company_id: -1
    }
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      City.create! valid_attributes
      get cities_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    it 'returns http success' do
      get cities_url, headers: valid_headers, as: :json
      expect(response.status).to eq 200
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      city = City.create! valid_attributes
      get city_url(city), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new City' do
        expect do
          post cities_url,
               params: { city: valid_attributes }, headers: valid_headers, as: :json
        end.to change(City, :count).by(1)
      end

      it 'renders a JSON response with the new city' do
        post cities_url,
             params: { city: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new City' do
        expect do
          post cities_url,
               params: { city: invalid_attributes }, as: :json
        end.to change(City, :count).by(0)
      end

      it 'renders a JSON response with errors for the new city' do
        post cities_url,
             params: { city: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let!(:city) do
        City.create(
          description: 'Original Description City',
          state: 'Original State',
          company_id: 1
        )
      end

      it 'valid city attributes' do
        patch city_url(city), params:
          {
            description: 'New Description City',
            state: 'New State',
            company_id: 2
          }, headers: valid_headers, as: :json

        expect(response.status).to eq(200)
        expect(city.reload.description).to eq('New Description City')
        expect(city.reload.state).to eq('New State')
        expect(city.reload.company_id).to eq(2)
      end

      it 'invalid city attributes' do
        patch city_url(city), params: {
          description: nil,
          state: '',
          company_id: -1
        }, headers: valid_headers, as: :json

        expect(response.status).to eq(422)
        expect(city.reload.description).to eq('Original Description City')
        expect(city.reload.state).to eq('Original State')
        expect(city.reload.company_id).to eq(1)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested city' do
      city = City.create! valid_attributes
      expect do
        delete city_url(city), headers: valid_headers, as: :json
      end.to change(City, :count).by(-1)
    end
  end
end
