require 'rails_helper'

RSpec.describe "/companies", type: :request do
  let(:valid_attributes) {
    {
      description: "Company description",
      email: "company@example.com",
      password: "password"
    }
  }

  let(:invalid_attributes) {
    {
      description: "",
      email: "",
      password: ""
    }
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Company.create! valid_attributes
      get companies_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    it "returns http success" do
      get companies_url, headers: valid_headers, as: :json
      expect(response.status).to eq 200
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      company = Company.create! valid_attributes
      get company_url(company), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Company" do
        expect {
          post companies_url,
               params: { company: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Company, :count).by(1)
      end

      it "renders a JSON response with the new company" do
        post companies_url,
             params: { company: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Company" do
        expect {
          post companies_url,
               params: { company: invalid_attributes }, as: :json
        }.to change(Company, :count).by(0)
      end

      it "renders a JSON response with errors for the new company" do
        post companies_url,
             params: { company: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update_company" do
    context "with valid parameters" do
      let!(:company) {
        Company.create(
          description: 'Original Description Company',
          email: 'email@email.com',
          password: 'password')
      }

      it 'valid company attributes' do
        patch company_url(company), params:
          {
            description: 'New Description Company',
            email: 'new_email@email.com',
            password: 'new_password'
          }, headers: valid_headers, as: :json

        expect(response.status).to eq(200)
        expect(company.reload.description).to eq('New Description Company')
        expect(company.reload.email).to eq('new_email@email.com')
        expect(company.reload.password).to eq('new_password')
      end

      it 'invalid company attributes' do
        patch company_url(company), params: {
          description: nil,
          email: '',
          password: '123456'
        }, headers: valid_headers, as: :json

        expect(response.status).to eq(422)
        expect(company.reload.description).to eq('Original Description Company')
        expect(company.reload.email).to eq('email@email.com')
        expect(company.reload.password).to eq('password')
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested company" do
      company = Company.create! valid_attributes
      expect {
        delete company_url(company), headers: valid_headers, as: :json
      }.to change(Company, :count).by(-1)
    end
  end
end
