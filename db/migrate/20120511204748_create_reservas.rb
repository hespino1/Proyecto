class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.date :fecha
      t.string :hora
      t.integer :id_user
      t.timestamps
    end
  end
end
