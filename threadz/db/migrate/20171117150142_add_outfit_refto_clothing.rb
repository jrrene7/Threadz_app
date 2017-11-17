class AddOutfitReftoClothing < ActiveRecord::Migration[5.1]
  def change
    add_reference :clothings, :outfit, index: true, foreign_key: true
    add_reference :comments, :outfit, indexL true, foreign_key: true
    add_reference :comments, :clothing, index: true, foreign_key: true
    add_reference :comments, :user, index: true, foreign_key: true
  end
end
