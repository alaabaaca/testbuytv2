class CreateCokhungthoigians < ActiveRecord::Migration
  def change
    create_table :cokhungthoigians do |t|
      t.integer :id
      t.string :biensoxe
      t.int :makhungtg

      t.timestamps
    end
  end
end
