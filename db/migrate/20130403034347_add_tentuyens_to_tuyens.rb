class AddTentuyensToTuyens < ActiveRecord::Migration
  def change
    add_column :tuyens, :tentuyen2, :string
  end
end
