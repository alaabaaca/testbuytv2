# encoding: UTF-8
class Congty < ActiveRecord::Base
  attr_accessible :diachict, :id, :sodtct, :tenct

  has_many :taikhoan
  has_many :chuyen

  validates :tenct,
            :presence => {:message => "Tên công ty không được rỗng"}
  validates :diachict,
            :presence => {:message => "Địa chỉ không được rỗng"}
  validates :sodtct,
            :presence => {:message => "Số điện thoại không được rỗng"}
  validates :sodtct, :numericality => {
      :only_integer => true,
      :message => "Số điện thoại phải là chuỗi số nguyên dương"
  }
end
