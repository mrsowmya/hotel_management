# frozen_string_literal: true

module HotelManagement
  class Delux < Room
    def initialize(name:, price:)
      super
      @ac = false
      @price = price.nil? ? 2000 : price
    end
  end
end