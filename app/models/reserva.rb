class Reserva < ActiveRecord::Base
  belongs_to :user
  validates :deporte , :presence => {:message =>"Seleccione un deporte para poder continuar"}
  validates :hora, :presence =>  {:message => "Seleccione una hora "}
  validates_uniqueness_of :fecha, :scope => [:hora, :deporte], :message => "Ya existe una reserva para la fecha, hora y deporte seleccionado"
end
