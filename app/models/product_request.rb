class ProductRequest < ActiveRecord::Base
  has_many :offers, inverse_of: :product_request, dependent: :destroy

  validates :product_name, length: { minimum: 2 }
end
