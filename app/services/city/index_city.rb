# frozen_string_literal: true

module City
  class IndexCity
    include Callable

    def call
      index
    end

    private

    def index
      @cities = City.all
    end
  end
end
