# frozen_string_literal: true

require './hotel_management/room'
require './hotel_management/delux'

module HotelManagement
  describe Delux do
    describe '#create' do
      room1 = HotelManagement::Delux.create(name: 'room1')

      it 'should list under all' do
        expect(HotelManagement::Room.all).to include(room1)
      end

      it 'should list under available' do
        expect(HotelManagement::Room.available).to include(room1)
      end

      it 'ac should be false' do
        expect(room1.ac).to be_falsey
      end

      it 'price should be 1000' do
        expect(room1.price).to eq(2000)
      end
    end
  end
end