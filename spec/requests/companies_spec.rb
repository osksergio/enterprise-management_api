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

  describe "DELETE /destroy" do
    it "destroys the requested company" do
      company = Company.create! valid_attributes
      expect {
        delete company_url(company), headers: valid_headers, as: :json
      }.to change(Company, :count).by(-1)
    end
  end
end
