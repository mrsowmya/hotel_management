# frozen_string_literal: true

module HotelManagement
  class Room
    @@rooms = []
    attr_accessor :name, :price, :checked_in, :user, :ac

    def initialize(name:, price:)
      @name = name
      @price = price.nil? ? 1000 : price
      @checked_in = false
    end

    def check_in(user:)
      self.checked_in = true
      self.user = user

      self
    end

    def check_out
      self.checked_in = false
      self.user = nil

      self
    end

    class << self
      def create(name:, price: nil)
        room = new(name: name, price: price)
        @@rooms << room

        room
      end

      def available
        @@rooms.reject(&:checked_in)
      end

      def all
        @@rooms
      end
    end
  end
end