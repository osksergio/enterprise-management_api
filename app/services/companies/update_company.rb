# frozen_string_literal: true

module Companies
  class UpdateCompany
    include Callable

    def initialize(params)
      @id = params[:id]
      @description = params[:description]
      @email = params[:email]
      @password = params[:password]
    end

    attr_reader :company, :test

    def call
      test
      build
      persist if valid?
    end

    def test
      @test = 'Testando o attr_reader'
    end

    private

    def build
      @company = Company.find(@id)
      @company.assign_attributes(description: @description, email: @email, password: @password)
    end

    def valid?
      return true if @company.valid?

      add_error(@company)
      false
    end

    def persist
      @company.save
    end
  end
end
