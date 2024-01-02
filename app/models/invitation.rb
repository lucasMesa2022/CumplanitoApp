class Invitation < ApplicationRecord
  validates :host_name, :event_address, :host_phone, :event_date, presence: true
end
