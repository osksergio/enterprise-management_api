# frozen_string_literal: true

module City
  class ShowCity
    include Callable

    def initialize(city_id)
      @city = City.find(city_id)
    end

    def call
      show if valid?
    end

    private

    def valid?
      return true if @city.present?

      errors.add(:base, 'City not found')
      false
    end

    def show
      @city
    end
  end
end