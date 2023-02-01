class Company::UpdateCompany
  include Callable

  def initialize(id, description, email, password)
    @id = params[:id]
    @description = params[:description]
    @email = params[:email]
    @password = params[:password]
  end

  def call
    build
    persist if valid?
  end

  private

  def build
    @company = Company.find(@id)
    @company.assign_attributes(description: @description, email: @email, password: @password)
  end

  def valid?
    @company.valid?
  end

  def persist
    @company.save
  end
end