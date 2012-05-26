class CreateInvitaciones < ActiveRecord::Migration
  def change
    create_table :invitaciones do |t|
      t.string :user_id
      t.string :reserva_id

      t.timestamps
    end
  end
end
