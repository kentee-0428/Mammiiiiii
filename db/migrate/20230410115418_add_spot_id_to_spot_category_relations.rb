class AddSpotIdToSpotCategoryRelations < ActiveRecord::Migration[6.1]
  def change
    add_column :spot_category_relations, :spot_id, :integer
  end
end
