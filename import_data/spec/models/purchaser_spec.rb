require 'spec_helper'

describe Purchaser do

  describe '.add' do
    context 'when the purchaser does not exist in the database' do
      it 'should create a new user' do
        expect { Purchaser.add('New User') }.to change(Purchaser, :count).from(0).to(1)
      end
    end

    context 'when the purchaser already exists in the database' do
      before(:each) { Purchaser.create(first_name: 'Old', last_name: 'User') }

      it 'should not create a new user' do
        expect { Purchaser.add('Old User') }.not_to change(Purchaser, :count)
      end
    end
  end

  describe '#purchase' do
    subject(:purchaser) { Purchaser.create(first_name: 'Old', last_name: 'User') }

    before(:each) do
      @merchant = Merchant.new(id: 1, business_name: 'Fake Shop', street_address: '1234 5th Ave.')
      @product = Product.new(id: 1, description: 'bogus object', unit_price: 10.0, merchant_id: 1)
    end

    it 'should create a new purchase for the user' do
      expect { purchaser.purchase(1, @product, @merchant) }.to change(purchaser.purchases, :count).from(0).to(1)
    end

    it 'should return the total price of the new purchase' do
      expect(purchaser.purchase(3, @product, @merchant)).to eq 30.0
    end
  end

end

