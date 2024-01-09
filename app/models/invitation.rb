class Invitation < ApplicationRecord
  validates :host_name, :event_address, :host_phone, :event_date, presence: true

  def get_coordinates
    coordinates = Geocoder.search(event_address).first.coordinates

    if coordinates.present?
      self.event_latitude = coordinates[0]
      self.event_longitude = coordinates[1]
      save
    end
  end

  def format_phone(country_code:)
    full_phone_number = PhonyRails.normalize_number(self.host_phone, country_code:)
    if PhonyRails.plausible_number?(full_phone_number)
      self.host_phone = full_phone_number
      save
    end
  end

  def generate_map
    "https://maps.geoapify.com/v1/staticmap?style=osm-carto&width=300&height=300&center=lonlat:#{event_longitude},#{event_latitude}&zoom=15&marker=lonlat:#{event_longitude},#{event_latitude};color:%23ff0000;size:medium&apiKey=#{ENV['API_KEY']}"
  end
end
