class CreateTaikhoans < ActiveRecord::Migration
  def change
    create_table :taikhoans do |t|
      t.integer :id
      t.integer :mact
      t.string :tentk
      t.string :matkhau

      t.timestamps
    end
  end
end
