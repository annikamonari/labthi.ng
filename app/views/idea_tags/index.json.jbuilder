json.array!(@idea_tags) do |idea_tag|
  json.extract! idea_tag, :name
  json.url idea_tag_url(idea_tag, format: :json)
end
