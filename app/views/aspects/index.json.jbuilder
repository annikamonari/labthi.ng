json.array!(@aspects) do |aspect|
  json.extract! aspect, :brief
  json.url aspect_url(aspect, format: :json)
end
