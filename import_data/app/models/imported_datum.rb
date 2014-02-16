require 'csv'

class ImportedDatum

  include ActiveModel::Model

  attr_accessor :file

  def import
    begin
      gross_revenue = 0.0
      content = file.read
      CSV.parse(content, col_sep: "\t", headers: true) do |row|
        purchaser = Purchaser.add(row['purchaser name'])
        merchant = Merchant.add(row['merchant name'], row['merchant address'])
        product = merchant.add_product(row['item description'], row['item price'])
        gross_revenue += purchaser.purchase(row['purchase count'], product, merchant)
      end
      return gross_revenue
    rescue => e
      return false
    end
  end

end

