json.array!(@team_applications) do |team_application|
  json.extract! team_application, :id, :pitch, :post_id, :user_id
  json.url team_application_url(team_application, format: :json)
end
