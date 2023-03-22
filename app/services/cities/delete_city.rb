# frozen_string_literal: true

module Cities
  class DeleteCity
    include Callable

    def initialize(city_id)
      @city_id = city_id
    end

    def call
      destroy if valid?
    end

    private

    def valid?
      @city = City.find(@city_id)
      true
    rescue StandardError
      add_error(nil, 'cities', 'not_found')
      false
    end

    def destroy
      @city.destroy
    end
  end
end
