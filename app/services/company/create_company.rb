#class Company::Create
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
    existing_email = Company.find_by email: @email
    if existing_email.present?
      errors.add(:email, "has already been taken")
      return false
      raise StandardError, 'Company already exists'
    else
      return true
    end
  end

  def persist
    @company.save
  end
end