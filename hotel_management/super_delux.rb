# frozen_string_literal: true

module HotelManagement
  class SuperDelux < Room
    def initialize(name:, price:)
      super
      @ac = true
      @price = price.nil? ? 3000 : price
    end
  end
end