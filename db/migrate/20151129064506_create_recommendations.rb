class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.text :summary, null: false
      t.text :content, null: false
      t.timestamps null: false
    end
  end
end
