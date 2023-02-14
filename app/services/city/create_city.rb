# frozen_string_literal: true

module City
  # class city >> implementing methods to create a new city
  class CreateCity
    include Callable

    def initialize(cities_params)
      @cities_params = cities_params
    end

    attr_reader :city

    def call
      build
      persist if valid?
    end

    private

    def build
      @city = City.new(@cities_params)
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
