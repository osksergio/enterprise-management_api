class Company::Create
  include Callable

  def initialize(company_params)
    @company_params = company_params
  end

  def call
    build
    persist if valid?
  end

  private

  def build
    @company = Company.new(@company_params)
  end

  def valid?
    @company.valid?
  end

  def persist
    @company.save
  end
end