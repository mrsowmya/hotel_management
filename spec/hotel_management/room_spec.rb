# frozen_string_literal: true

require './hotel_management/room'
require './hotel_management/user'

module HotelManagement
  describe Room do
    describe '#create' do
      room1 = HotelManagement::Room.create(name: 'room1')

      it 'should list under all' do
        expect(HotelManagement::Room.all).to include(room1)
      end

      it 'should list under available' do
        expect(HotelManagement::Room.available).to include(room1)
      end

      it 'price should be 500' do
        expect(room1.price).to eq(1000)
      end
    end

    describe 'check_in' do
      room1 = HotelManagement::Room.create(name: 'room1')
      user1 = HotelManagement::User.create(name: 'st 1', address: 'Address', phone_number: 'phone_number', proof: '123232')

      before do
        room1.check_in(user: user1)
      end

      it 'should update the checked_in as true' do
        expect(room1.checked_in).to be_truthy
      end

      it 'should assign the user to room' do
        expect(room1.user).to eq(user1)
      end

      it 'should not list under available list' do
        expect(HotelManagement::Room.available).not_to include(room1)
      end
    end

    describe 'check_out' do
      room1 = HotelManagement::Room.create(name: 'room1')
      user1 = HotelManagement::User.create(name: 'User 1', address: 'Address', phone_number: 'phone_number', proof: '123232')

      before do
        room1.check_in(user: user1)
        room1.check_out
      end

      it 'should update the checked_in as false' do
        expect(room1.checked_in).to be_falsey
      end

      it 'should remove the user from room' do
        expect(room1.user).to be_nil
      end

      it 'should list under available list' do
        expect(HotelManagement::Room.available).to include(room1)
      end
    end
  end
end