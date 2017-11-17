class RemoveOutfitIdFromClothing < ActiveRecord::Migration[5.1]
  def change
    remove_column :clothings, :outfit_id, :integer
  end
end
