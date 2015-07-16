json.(surface, :id, :code, :price, :image)


json.campaigns surface.campaigns do |campaign|
  json.name campaign.name_of_campaign
  json.start_time campaign.start_time.to_time.iso8601
  json.end_time campaign.end_time.to_time.iso8601
  json.created_at campaign.created_at
  json.updated_at campaign.updated_at
  json.id campaign.id
end