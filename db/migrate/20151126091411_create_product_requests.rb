class CreateProductRequests < ActiveRecord::Migration
  def change
    create_table :product_requests do |t|
      t.string :product_name

      t.timestamps null: false
    end
  end
end
