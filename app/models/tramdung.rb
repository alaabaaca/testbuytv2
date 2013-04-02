# encoding: UTF-8
class Tramdung < ActiveRecord::Base
  attr_accessible :diachitram, :id, :matram, :tentram

  has_many :diquatram

  validates :tentram,
            :presence => {:message => "Tên trạm không được rỗng"}
  validates :diachitram,
            :presence => {:message => "Địa chỉ trạm không được rỗng"}
end
