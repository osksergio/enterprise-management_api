class Company::UpdateCompany
  include Callable

  def initialize(id)
    @id = id
  end

  def call
    build
    persist if valid?
  end

  private

  def build
    @company = Company.find(@id)
    @company.assign_attributes(description: @company.description, email: @company.email, password: @company.password)
  end

  def valid?
    @company.valid?
  end

  def persist
    @company.save
  end
end