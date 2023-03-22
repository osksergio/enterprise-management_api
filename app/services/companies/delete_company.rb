# frozen_string_literal: true

module Companies
  class DeleteCompany
    include Callable

    def initialize(company_id)
      @company = begin
        Company.find(company_id)
      rescue StandardError
        nil
      end
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
end
