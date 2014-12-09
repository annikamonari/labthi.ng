json.array!(@votes) do |vote|
  json.extract! vote, :id, :kind, :user_id, :kind_id
  json.url vote_url(vote, format: :json)
end
