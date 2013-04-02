class CreateTramdungs < ActiveRecord::Migration
  def change
    create_table :tramdungs do |t|
      t.integer :id
      t.integer :matram
      t.string :tentram
      t.string :diachitram

      t.timestamps
    end
  end
end
