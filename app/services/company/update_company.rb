class Company::UpdateCompany
  include Callable

  def initialize(company_params)
    @company_params = company_params
  end

  def call
    build
  end

  private

  def build
    @company = Company.update(@company_params)
  end

  # NÃO ESQUECER DE VERIFICAR: COMO VALIDAR E PERSISTIR NO DATABASE
  # UPDATE

  #def valid?
  #  @company.valid?
  #end

  #def persist
  #  @company.save
  #end
end