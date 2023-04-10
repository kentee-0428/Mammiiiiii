class ChangePostCategoryRelationsToSpotCategoryRelations < ActiveRecord::Migration[6.1]
  def change
    rename_table :post_category_relations, :spot_category_relations
  end
end
