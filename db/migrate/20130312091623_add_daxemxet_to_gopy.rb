class AddDaxemxetToGopy < ActiveRecord::Migration
  def change
    add_column :gopies, :daxemxet, :bit
  end
end
