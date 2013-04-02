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
end
