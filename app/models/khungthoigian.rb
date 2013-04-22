# encoding: UTF-8
class Khungthoigian < ActiveRecord::Base
  attr_accessible :den, :di, :id

  has_many :cokhungthoigian

  validates :di, :presence => {:message => "Thời gian đi không được rỗng"}
  validates  :den, :presence => {:message => "Thời gian đến không được rỗng"}
  validates :di, :uniqueness => {:scope => :den,
  :message => 'Dữ liệu này đã bị trùng. Vui lòng chọn giá trị khác cho thời gian đi hoặc thời gian đến đích'}
  #validates :di, :den, :uniqueness => {
  #:message => 'Dữ liệu này đã bị trùng. Vui lòng chọn giá trị khác cho thời gian đi hoặc thời gian đến đích'}
  self.per_page = 10

end
