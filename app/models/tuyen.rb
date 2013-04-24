# encoding: UTF-8
class Tuyen < ActiveRecord::Base
  attr_accessible :culy, :giancach, :id, :loaihinh, :matuyen, :sochuyen,
                  :tentuyen, :tghoatdong, :thoigianchuyen, :tentuyen2

  has_many :diquatram
  has_many :chuyen
  has_many :diemtrentuyen

  validates :matuyen,
            :presence => {:message => "Mã tuyến không được rỗng"}
  validates :tentuyen,
            :presence => {:message => "Điểm xuất phát không được rỗng"}
  validates :tentuyen2,
            :presence => {:message => "Đích đến không được rỗng"}
  validates :culy,
            :presence => {:message => "Cự ly không được rỗng"}
  validates :giancach,
            :presence => {:message => "Giãn cách không được rỗng"}
  validates :loaihinh,
            :presence => {:message => "Loại hình không được rỗng"}
  validates :sochuyen,
            :presence => {:message => "Số chuyến không được rỗng"}
  validates :sochuyen,
            :numericality => {:only_integer => true, :greater_than => 0,
                              :message => "Số chuyến phải là số nguyên dương"}
  validates :thoigianchuyen,
            :numericality => {:only_integer => true, :greater_than => 0,
                              :message => "Thời gian chuyến phải là số nguyên dương"}
  validates :giancach,
            :numericality => {:only_integer => true, :greater_than => 0,
                              :message => "Giãn cách phải là số nguyên dương"}
  validates :culy,
            :numericality => {:only_integer => true, :greater_than => 0,
                              :message => "Cự ly phải là số nguyên dương"}

  validates :matuyen,
            :numericality => {:only_integer => true, :greater_than => 0,
                              :message => "Mã tuyến phải là số nguyên dương"}

  self.per_page = 10

end
