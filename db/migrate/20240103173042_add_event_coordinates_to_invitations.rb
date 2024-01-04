class AddEventCoordinatesToInvitations < ActiveRecord::Migration[7.1]
  def change
    add_column :invitations, :event_latitude, :float
    add_column :invitations, :event_longitude, :float
  end
end
