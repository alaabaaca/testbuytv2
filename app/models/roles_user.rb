# encoding: UTF-8
class RolesUser < ActiveRecord::Base
  attr_accessible :role_id, :user_id

  validates :role_id, :uniqueness => {:scope => :user_id,
  :message => 'Dữ liệu này đã bị trùng. Vui lòng chọn giá trị khác'}

  self.per_page = 10
end
