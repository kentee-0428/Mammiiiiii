class RemovePostIdFromSpotCategoryRelation < ActiveRecord::Migration[6.1]
  def change
    remove_column :spot_category_relations, :post_id, :integer
  end
end
