class CreateChuyens < ActiveRecord::Migration
  def change
    create_table :chuyens do |t|
      t.integer :id
      t.string :biensoxe
      t.integer :mact
      t.integer :matuyen
      t.integer :soghe

      t.timestamps
    end
  end
end
