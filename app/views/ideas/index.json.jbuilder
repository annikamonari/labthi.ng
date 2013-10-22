json.array!(@ideas) do |idea|
  json.extract! idea, :title, :phase, :brief, :image, :active
  json.url idea_url(idea, format: :json)
end
