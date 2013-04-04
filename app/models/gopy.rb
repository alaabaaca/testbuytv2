class Gopy < ActiveRecord::Base
  attr_accessible :biensoxe, :id, :noidung, :daxemxet

  belongs_to :chuyen

  #self.per_page = 1

end
