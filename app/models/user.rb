class User < ActiveRecord::Base
  validates :nombre, :presence => true
  validates :correo, :presence => true
  validates :cedula, :presence => true, :numericality => true
  validates :password, :presence => true,


end
