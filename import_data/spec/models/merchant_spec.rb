require 'spec_helper'

describe Merchant do

  describe '.add' do
    context 'when the merchant does not exist in the database' do
      it 'should create a new merchant' do
        expect { Merchant.add('New Bogus Shop', '1234 5th Ave.') }.to change(Merchant, :count).from(0).to(1)
      end
    end

    context 'when the merchant already exists in the database' do
      before(:each) { Merchant.create(business_name: 'Old Fake Shop', street_address: '6789 10th St.') }

      it 'should not create a new merchant' do
        expect { Merchant.add('Old Fake Shop', '6789 10th St.') }.not_to change(Merchant, :count)
      end
    end
  end

  describe '#add_product' do
    subject(:merchant) { Merchant.create(business_name: 'Old Fake Shop', street_address: '6789 10th St.') }

    context 'when the merchant does not have the product in the database' do
      it 'should create a new product for the merchant' do
        expect { merchant.add_product('New object', '10.0') }.to change(merchant.products, :count).from(0).to(1)
      end
    end

    context 'when the merchant already has the product in the database' do
      before(:each) { Product.create(description: 'Old object', unit_price: 20.0, merchant_id: merchant.id) }

      it 'should not create a new product for the merchant' do
        expect { merchant.add_product('Old object', '20.0').not_to change(merchant.products, :count) }
      end
    end
  end

end

