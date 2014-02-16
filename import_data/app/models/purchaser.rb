class Purchaser < ActiveRecord::Base

  has_many :purchases, dependent: :destroy
  has_many :products, through: :purchases

  class << self
    def add(full_name)
      names = full_name.split(/\s+/)
      first_name, last_name = [names.first, names.last]
      record = find_or_create_by(last_name: last_name, first_name: first_name)
    end
  end

  def purchase(item_count, product, merchant)
    line_item = self.purchases.create(item_count: item_count.to_i, product: product, merchant: merchant)
    line_item.update_attribute(:total_price, BigDecimal(product.unit_price * line_item.item_count))
    line_item.total_price
  end

end

