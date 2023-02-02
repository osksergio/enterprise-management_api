class Company::IndexCompany
  include Callable

  def call
    index
  end

  private

  def index
    @companies = Company.all
  end
end