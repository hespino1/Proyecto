class AddDeporteToReserva < ActiveRecord::Migration
  def change
    add_column :reservas, :deporte, :string

  end
end
