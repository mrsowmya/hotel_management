# frozen_string_literal: true

module HotelManagement
  class User
    attr_accessor :name, :address, :phone_number, :proof
    @@users = []

    def initialize(name:, address:, phone_number:, proof:)
      @name = name
      @address = address
      @phone_number = phone_number
      @proof = proof
    end

    def update(*args)
      args.each do |hsh|
        hsh.each do |key, val|
          public_send("#{key}=", val) if respond_to?("#{key}=")
        end
      end

      self
    end

    class << self
      def create(name:, address:, phone_number: nil, proof: nil)
        user = User.new(name: name,
                        address: address,
                        phone_number: phone_number,
                        proof: proof)

        @@users << user

        user
      end

      def find(name:)
        @@users.detect { |user| user.name.downcase == name&.downcase }
      end

      def all
        @@users
      end
    end
  end
end
