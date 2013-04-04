class AddKinhdoToTramdungs < ActiveRecord::Migration
  def change
    add_column :tramdungs, :kinhdo, :string
  end
end
