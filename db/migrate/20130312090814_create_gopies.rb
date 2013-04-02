class CreateGopies < ActiveRecord::Migration
  def change
    create_table :gopies do |t|
      t.integer :id
      t.string :noidung
      t.string :biensoxe

      t.timestamps
    end
  end
end
