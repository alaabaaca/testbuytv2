class AddLuotToCokhungthoigians < ActiveRecord::Migration
  def change
    add_column :cokhungthoigians, :luot, :integer
  end
end
