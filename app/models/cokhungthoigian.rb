# encoding: UTF-8
class Cokhungthoigian < ActiveRecord::Base
  attr_accessible :biensoxe, :id, :makhungtg, :luot

  self.per_page =10

  belongs_to :khungthoigian
  belongs_to :chuyen

  validates :biensoxe, :presence => {
      :message => "Biển số xe không được rỗng"
  }
  validates :makhungtg, :presence => {
      :message => "Khung thời gian không được rỗng"
  }
  validates :biensoxe, :uniqueness => {:scope => [:makhungtg, :luot],
  :message => 'Dữ liệu này đã bị trùng. Vui lòng chọn giá trị khác'}
end
