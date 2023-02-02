class Company::IndexCompany
  include Callable

  def initialize
    @companies = Company.all
  end
  
  def call
    index
  end

  private

  def index
    @companies
  end
end