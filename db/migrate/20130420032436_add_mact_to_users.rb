class AddMactToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mact, :integer
  end
end
