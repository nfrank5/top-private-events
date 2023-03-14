class AddAcceptToInvitations < ActiveRecord::Migration[7.0]
  def change
    add_column :invitations, :accept, :boolean
  end
end
