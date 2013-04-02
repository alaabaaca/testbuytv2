class CreateDiemtrentuyens < ActiveRecord::Migration
  def change
    create_table :diemtrentuyens do |t|
      t.integer :id
      t.integer :matuyen
      t.string :vido
      t.string :kinhdo

      t.timestamps
    end
  end
end
