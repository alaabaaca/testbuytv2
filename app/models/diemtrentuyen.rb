# encoding: UTF-8
class Diemtrentuyen < ActiveRecord::Base
  attr_accessible :id, :kinhdo, :matuyen, :vido

  belongs_to :tuyen

  validates :matuyen,
            :presence =>  { :message => "Tuyen không được rỗng"}
  validates :kinhdo,
            :presence =>  { :message => "Kinh do không được rỗng"}
  validates :vido,
            :presence =>  { :message => "Vi do không được rỗng"}

  validates :vido, :uniqueness => {:scope => :kinhdo,
  :message => 'Dữ liệu này đã bị trùng. Vui lòng chọn giá trị khác cho vĩ độ hoặc kinh độ'}

  self.per_page = 10
end
