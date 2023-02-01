require 'rails_helper'

RSpec.describe Company::UpdateCompany do
  let(:params) {
    {
      description: "Silva & Silva Company Inc.",
      email: "silva@silva.com",
      password: "123456"
    }
  }

  context "modify company data" do
    it "change company e-mail" do
      service = Company::CreateCompany.call(params)
      service.Company::UpdateCompany.call(service.id)

      expect(service.email).to eq("silva2023@gmail.com")
    end
  end
end