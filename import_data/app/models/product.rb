class Product < ActiveRecord::Base

  belongs_to :merchant
  belongs_to :purchase

end

