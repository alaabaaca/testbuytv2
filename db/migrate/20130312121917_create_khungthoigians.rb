class CreateKhungthoigians < ActiveRecord::Migration
  def change
    create_table :khungthoigians do |t|
      t.integer :id
      t.time :di
      t.time :den

      t.timestamps
    end
  end
end
