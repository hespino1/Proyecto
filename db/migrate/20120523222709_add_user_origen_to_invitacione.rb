class AddUserOrigenToInvitacione < ActiveRecord::Migration
  def change
    add_column :invitaciones, :user_origen, :string

  end
end
