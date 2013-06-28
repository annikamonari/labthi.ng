json.array!(@ideas) do |idea|
  json.extract! idea, :phase, :brief, :image, :active, :industry
  json.url idea_url(idea, format: :json)
end
