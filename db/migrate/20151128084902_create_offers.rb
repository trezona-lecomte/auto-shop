class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :product_request, index: true, foreign_key: true
      t.monetize :price
      t.string :url, null: false
      t.string :product_name, null: false
      t.string :source_name, null: false
      t.string :source_location
      t.text :product_description
      t.string :image_url

      t.timestamps null: false
    end
  end
end
