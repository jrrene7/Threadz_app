class CreateClothings < ActiveRecord::Migration[5.1]
  def change
    create_table :clothings do |t|
      t.string :name
      t.string :type
      t.string :image

      t.timestamps
    end
  end
end
