class CreateDiquatrams < ActiveRecord::Migration
  def change
    create_table :diquatrams do |t|
      t.integer :id
      t.integer :matuyen
      t.integer :matram

      t.timestamps
    end
  end
end
