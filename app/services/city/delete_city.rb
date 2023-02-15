# frozen_string_literal: true

module City
  # class to remove >> city exclusion service
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

      rescue
      add_error(nil, 'city', 'not_found')
      false
    end

    def destroy
      @city.destroy
    end
  end
end
