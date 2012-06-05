class Reserva < ActiveRecord::Base
  belongs_to :user
  validates :hora, :presence => true
  validates_uniqueness_of :fecha, :scope => :hora
end
