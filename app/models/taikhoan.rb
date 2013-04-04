# encoding: UTF-8
class Taikhoan < ActiveRecord::Base
  attr_accessible :id, :mact, :matkhau, :tentk

  belongs_to :congty

  validates :mact,
            :presence => {:message => "Công ty không được rỗng"}
  validates :tentk,
            :presence => {:message => "Tên tài khoảnkhông được rỗng"}
  validates :tentk, :uniqueness => {
      :message => "Tên tài khoản này đã tồn tại. Vui lòng chọn tên khác"}

#  before_create :hash_password
  #def hash_password
    #self.matkhau = Digest::MD5.hexdigest(self.matkhau)
 # end

  self.per_page = 5

end
