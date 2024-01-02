class CreateInvitations < ActiveRecord::Migration[7.1]
  def change
    create_table :invitations do |t|
      t.string :host_name 
      t.string :event_address
      t.string :host_phone
      t.text :event_description
      t.datetime :event_date

      t.timestamps
    end
  end
end
