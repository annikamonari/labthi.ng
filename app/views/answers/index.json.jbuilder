json.array!(@answers) do |answer|
  json.extract! answer, :brief
  json.url answer_url(answer, format: :json)
end
