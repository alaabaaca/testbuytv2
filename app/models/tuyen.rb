# encoding: UTF-8
class Tuyen < ActiveRecord::Base
  attr_accessible :culy, :giancach, :id, :loaihinh, :matuyen, :sochuyen,
                  :tentuyen, :tghoatdong, :thoigianchuyen

  has_many :diquatram
  has_many :chuyen
  has_many :diemtrentuyen

  validates :culy,
            :tentuyen, :tghoatdong, :thoigianchuyen,
            :presence =>  { :message => "Cự ly không được rỗng"}
  validates  :giancach,
            :tentuyen, :tghoatdong, :thoigianchuyen,
            :presence =>  { :message => "Giãn cách không được rỗng"}
  validates :loaihinh,
            :tentuyen, :tghoatdong, :thoigianchuyen,
            :presence =>  { :message => "Loại hình không được rỗng"}
  validates  :sochuyen,
            :tentuyen, :tghoatdong, :thoigianchuyen,
            :presence =>  { :message => "Số chuyến không được rỗng"}
  validates :sochuyen,
            :numericality => { :only_integer => true, :greater_than => 0,
                               :message => "Số chuyến phải là số nguyên dương"}
  validates  :thoigianchuyen,
            :numericality => { :only_integer => true, :greater_than => 0,
                               :message => "Thời gian chuyến phải là số nguyên dương"}
  validates :giancach,
            :numericality => { :only_integer => true, :greater_than => 0,
                               :message => "Giãn cách phải là số nguyên dương"}
  validates  :culy,
            :numericality => { :only_integer => true, :greater_than => 0,
                               :message => "Cự ly phải là số nguyên dương"}
end
