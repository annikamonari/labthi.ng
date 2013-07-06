json.array!(@comments) do |comment|
  json.extract! comment, :brief
  json.url comment_url(comment, format: :json)
end
