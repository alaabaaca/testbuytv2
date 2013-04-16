class UsersHaveAndBelongToManyRoles < ActiveRecord::Migration
=begin
  def up
  end

  def down
  end
=end
  def self.up
    create_table :roles_users, :id => false do |t|
      t.references :role, :user
    end
  end

  def self.down
    drop_table :roles_users
  end
end
