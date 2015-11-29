class AddContributorIdToRecommendation < ActiveRecord::Migration
  def change
    add_column :recommendations, :contributor_id, :integer, null: false, index: true, foreign_key: true
  end
end
