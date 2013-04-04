# encoding: UTF-8
class Khungthoigian < ActiveRecord::Base
  attr_accessible :den, :di, :id

  has_many :cokhungthoigian

  validates :di, :presence => {:message => "Thời gian đi không được rỗng"}
  validates  :den, :presence => {:message => "Thời gian đến không được rỗng"}

  self.per_page = 5

end
