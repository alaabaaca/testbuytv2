# encoding: UTF-8
class Role < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :users
  validates :name,
            :presence => {:message => "Tên quyền không được rỗng"}
end
