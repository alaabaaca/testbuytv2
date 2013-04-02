# encoding: UTF-8
class Cokhungthoigian < ActiveRecord::Base
  attr_accessible :biensoxe, :id, :makhungtg

  belongs_to :khungthoigian
  belongs_to :chuyen

  validates :biensoxe, :presence => {
      :message => "Biển số xe không được rỗng"
  }
  validates :makhungtg, :presence => {
      :message => "Khung thời gian không được rỗng"
  }
end
