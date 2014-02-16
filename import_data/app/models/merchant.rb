class Merchant < ActiveRecord::Base

  has_many :products, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :purchasers, through: :purchases

  class << self
    def add(name, address)
      # Because the address in the example file has only the street address, no
      # additional parsing will be performed for the given example.
      record = find_or_create_by(business_name: name, street_address: address)
    end
  end

  def add_product(description, unit_price)
    existing_product = products.where(description: description).first
    existing_product.present? ?
      existing_product :
      products.create(description: description, unit_price: BigDecimal.new(unit_price))
  end

end

