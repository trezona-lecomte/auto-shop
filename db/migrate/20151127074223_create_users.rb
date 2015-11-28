class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name, null: false
      t.string :email
      t.string :location
      t.string :image_url
      t.string :url
      t.string :token
      t.string :preferred_language, default: "en"
      t.timestamps null: false
    end
  end
end
