class User < ActiveRecord::Base
  validates :nombre, :presence =>   {:message => "No puede estar vacio "}
  validates :correo, :presence =>{:message => "No puede estar vacio "} ,:uniqueness =>{:message => "Esta dirrecion de correo ya existe"}
  validates :cedula, :presence => {:message => "No puede estar vacio "} ,:numericality =>  {:message => "No es una cedula valida "} ,:uniqueness =>  {:message => "La cedula ya existe "}
  validates :password, :presence => {:message => "No puede estar vacio "}

  has_many :reservas

end
