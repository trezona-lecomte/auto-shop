class AddRecipientIdToRecommendation < ActiveRecord::Migration
  def change
    add_column :recommendations, :recipient_id, :integer, null: false, index: true, foreign_key: true
  end
end
