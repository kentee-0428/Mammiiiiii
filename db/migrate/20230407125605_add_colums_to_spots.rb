class AddColumsToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :spot_image, :string
    add_column :spots, :user_id, :integer
  end
end
