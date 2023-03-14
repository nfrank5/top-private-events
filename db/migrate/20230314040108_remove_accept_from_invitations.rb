class RemoveAcceptFromInvitations < ActiveRecord::Migration[7.0]
  def change
    remove_column :invitations, :accept, :boolean
  end
end
