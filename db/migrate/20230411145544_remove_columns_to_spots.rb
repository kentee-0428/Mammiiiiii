class RemoveColumnsToSpots < ActiveRecord::Migration[6.1]
  def change
    remove_column :spots, :latitude, :float
    remove_column :spots, :longitude, :float
  end
end
