# frozen_string_literal: true

# class: get companies
module Companies
  class IndexCompany
    include Callable

    def call
      index
    end

    private

    def index
      @companies = Company.all
    end
  end
end
