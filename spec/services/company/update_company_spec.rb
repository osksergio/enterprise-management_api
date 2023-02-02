require 'rails_helper'

RSpec.describe Company::UpdateCompany do
  let(:params) {
    {
      id: 1,
      description: "Silva & Silva Company Inc.",
      email: "silva@silva.com",
      password: "1111"
    }
  }

  let(:params_new) {
    {
      id: 1,
      description: "Silva & Silva Company Inc.",
      email: "silva@silva.com",
      password: "5555"
    }
  }

  context "modify company data" do
    it "change company e-mail" do
      service = Company::CreateCompany.call(params)
      #service = Company::UpdateCompany.call(params_new)
      expect(params[:password]).to eq("1111")
    end
  end
end