json.array!(@solutions) do |solution|
  json.extract! solution, :brief, :aspect_id, :idea_id, :user_id
  json.url solution_url(solution, format: :json)
end
