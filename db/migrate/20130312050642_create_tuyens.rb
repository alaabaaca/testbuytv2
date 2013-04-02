class CreateTuyens < ActiveRecord::Migration
  def change
    create_table :tuyens do |t|
      t.integer :id
      t.integer :matuyen
      t.string :tentuyen
      t.string :loaihinh
      t.integer :culy
      t.integer :sochuyen
      t.integer :thoigianchuyen
      t.integer :giancach
      t.string :tghoatdong

      t.timestamps
    end
  end
end
