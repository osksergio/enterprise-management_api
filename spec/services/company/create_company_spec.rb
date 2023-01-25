require 'rails_helper'

RSpec.describe Company::Create do
  let(:params) {
    {
      description: "Silva & Silva Company Inc.",
      email: "silva@silva.com",
      password: "123456"
    }
  }

  context "When created company with valid parameters" do
    it "return  true" do
      service = Company::Create.call(params)
      expect(service).to be_truthy
    end
  end

  context "When created company with invalid parameters" do
    it "return nil" do
      service = Company::Create.call({description: ""})
      expect(service).to be_nil
    end
  end
end