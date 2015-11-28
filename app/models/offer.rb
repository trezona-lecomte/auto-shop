class Offer < ActiveRecord::Base
  belongs_to :product_request

  monetize :price_cents, with_model_currency: :currency,
                         numericality: { greater_than: 0 }

  validates :url,          presence: true
  validates :source_name,  presence: true
  validates :product_name, presence: true
end
