class CreateCokhungthoigians < ActiveRecord::Migration
  def change
    create_table :cokhungthoigians do |t|
      t.integer :id
      t.string :biensoxe
      t.integer :makhungtg

      t.timestamps
    end
  end
end
