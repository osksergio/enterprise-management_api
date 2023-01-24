class Company::Delete
  include Callable

  def initialize(company_id)
    @company = Company.find(company_id)
  end

  def call
    destroy if valid?
  end

  private

  def valid?
    return true if @company.present?
    errors.add(:base, 'Company not found')
    false
  end    


  def destroy
    @company.destroy
  end
end