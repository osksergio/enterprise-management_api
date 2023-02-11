# frozen_string_literal: true
class Company::CreateCompany
  include Callable

  def initialize(company_params)
    @company_params = company_params
  end

  attr_reader :company

  def call
    build
    persist if valid?
  end

  private

  def build
    @company = Company.new(@company_params)
  end

  def valid?
    return true if @company.valid?

    add_error(@company)
    false
  end

  def persist
    @company.save
  end
end
