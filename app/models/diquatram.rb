# encoding: UTF-8
class Diquatram < ActiveRecord::Base
  attr_accessible :id, :matram, :matuyen

  belongs_to :tuyen
  belongs_to :tramdung

  #self.primary_key = :matram, :matuyen

  validates :matram,
            :presence => {:message => "Trạm xe không được rỗng"}
  validates :matuyen,
            :presence => {:message => "Tuyến xe không được rỗng"}
  validates :matram, :uniqueness => {:scope => :matuyen,
  :message => 'Dữ liệu này đã bị trùng. Vui lòng chọn giá trị khác cho mã trạm hoặc mã tuyến'}

  self.per_page = 10

end
