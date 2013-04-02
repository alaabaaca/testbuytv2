class AddCongtyToGopy < ActiveRecord::Migration
  def change
    add_column :gopies, :congty, :integer
  end
end
