class Reserva < ActiveRecord::Base
  belongs_to :user
  validates :hora, :presence => true
end
