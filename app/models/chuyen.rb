# encoding: UTF-8
class Chuyen < ActiveRecord::Base
  attr_accessible :biensoxe, :id, :mact, :matuyen, :soghe

  self.per_page = 10

  belongs_to :tuyen
  belongs_to :congty
  has_many :gopy
  has_many :cokhungthoigian

  validates :biensoxe,
  :presence => {:message => "Biển số xe không được để trống"}
  validates :mact,
  :presence => {:message => "Công ty không được để trống"}
  validates :matuyen,
  :presence => {:message => "Tuyến xe không được để trống"}
  validates :soghe,
  :presence => {:message => "Số ghế  không được để trống"}

  validates :soghe, :numericality => {:only_integer => true, :greater_than => 0,
                                      :message => "Số ghế phải là số nguyên dương"}
end
