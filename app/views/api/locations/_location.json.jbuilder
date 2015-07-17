json.(location, :name, :street_address, :city, :state, :region, :country, :postal_code, :id, :created_at, :updated_at)

json.surfaces location.surfaces do |surface|
  json.surface_number surface.surface_number
  json.price surface.price
  json.image_path surface.image
end