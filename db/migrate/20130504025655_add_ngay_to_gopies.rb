class AddNgayToGopies < ActiveRecord::Migration
  def change
    add_column :gopies, :ngay, :date
  end
end
