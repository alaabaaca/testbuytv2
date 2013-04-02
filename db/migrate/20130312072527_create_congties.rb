class CreateCongties < ActiveRecord::Migration
  def change
    create_table :congties do |t|
      t.integer :id
      t.integer :mact
      t.string :tenct
      t.string :diachict
      t.integer :sodtct

      t.timestamps
    end
  end
end
