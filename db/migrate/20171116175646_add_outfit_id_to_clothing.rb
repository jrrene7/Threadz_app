class AddOutfitIdToClothing < ActiveRecord::Migration[5.1]
  def change
    add_column :clothings, :outfit_id, :integer
  end
end
