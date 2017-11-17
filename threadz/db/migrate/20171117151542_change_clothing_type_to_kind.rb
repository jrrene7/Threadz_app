class ChangeClothingTypeToKind < ActiveRecord::Migration[5.1]
  def change
    rename_column :clothings, :type, :kind
  end
end
