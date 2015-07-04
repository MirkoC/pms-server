json.array!(@surfaces) do |surface|
  json.partial! 'api/surfaces/surface', surface: surface
end