json.array!(@surface_types) do |surface_type|
  json.partial! 'api/surface_types/surface_type', surface_type: surface_type
end