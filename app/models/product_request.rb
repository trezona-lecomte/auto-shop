class ProductRequest < ActiveRecord::Base
  validates :product_name, length: { minimum: 2 }
end
