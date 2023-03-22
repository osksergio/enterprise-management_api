# frozen_string_literal: true

# class: service to update cities entity
module Cities
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
      @city = City.find(@id)
      @city.assign_attributes(description: @description, state: @state,
                              company_id: @company_id)
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
