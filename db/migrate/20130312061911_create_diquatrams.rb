class CreateDiquatrams < ActiveRecord::Migration
  def change
    create_table :diquatrams do |t|
      t.integer :id
      t.integer :matuyen
      t.integer :matram

      t.timestamps
    end

    execute <<-SQL
      ALTER TABLE diquatrams
        ADD CONSTRAINT fk_tuyens_diquatrams
        FOREIGN KEY (id)
        REFERENCES tuyens(matuyen)
        ON DELETE NO ACTION
    SQL
  end
end
