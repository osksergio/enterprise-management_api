class DeleteCompany
  include Callable

  def initialize(company_id)
    @company = Company.find(company_id)
  end

  def call
    destroy if valid?
  end

  private

  def valid?
    if @company.nil?
      errors.add(:base, 'Company not found')
      return false
    else
      return true
    end
  end

  def destroy
    @company.destroy
  end
end