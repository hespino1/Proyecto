class User < ActiveRecord::Base
  validates :nombre, :presence =>   {:message => "No puede estar vacio "}
  validates :correo, :presence => true, :uniqueness => true
  validates :cedula, :presence => true, :numericality => true, :uniqueness => true
  validates :password, :presence => true

  has_many :reservas

end
