# frozen_string_literal: true

class Company::DeleteCompany
  include Callable

  def initialize(company_id)
    @company = Company.find(company_id) rescue nil
  end

  def call
    destroy if valid?
  end

  private

  def valid?
    return true if @company.present?

    add_error(nil, 'company', 'not_found')
    false
  end

  def destroy
    @company.destroy
  end
end
