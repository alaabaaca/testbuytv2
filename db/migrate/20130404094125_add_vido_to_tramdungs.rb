class AddVidoToTramdungs < ActiveRecord::Migration
  def change
    add_column :tramdungs, :vido, :string
  end
end
