# frozen_string_literal: true

module Cities
  # service object: update city
  class UpdateCity
    include Callable

    def initialize(params)
      @id = params[:id]
      @description = params[:description]
      @state = params[:state]
      @company_id = params[:company_id]
    end

    attr_reader :city

    def call
      build
      persist if valid?
    end

    private

    def build
      #
    end

    def valid?
      return true if @city.valid?

      add_error(@city)
      false
    end

    def persist
      @city.save
    end
  end
end