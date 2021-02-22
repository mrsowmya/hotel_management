# frozen_string_literal: true

require './hotel_management/user'

module HotelManagement
  describe User do
    describe '#create' do
      user1 = HotelManagement::User.create(name: 'User 1', address: 'Address', phone_number: 'phone_number', proof: '123232')

      it 'should list under all' do
        expect(HotelManagement::User.all).to include(user1)
      end
    end

    describe '#find' do
      name = 'User 2'
      user1 = HotelManagement::User.create(name: name, address: 'Address', phone_number: 'phone_number', proof: '123232')

      it 'should find the user when finding correct name' do
        expect(HotelManagement::User.find(name: name)).to eq(user1)
      end

      it 'should return nil when finding incorrect name' do
        expect(HotelManagement::User.find(name: 'foobar')).to be_nil
      end
    end

    describe '#update' do
      new_name = 'User 4'
      user1 = HotelManagement::User.create(name: 'User 1', address: 'Address', phone_number: 'phone_number', proof: '123232')

      before do
        user1.update(name: new_name)
      end

      it 'should find the user' do
        expect(user1.name).to eq(new_name)
      end
    end
  end
end