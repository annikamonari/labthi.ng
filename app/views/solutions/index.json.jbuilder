json.array!(@solutions) do |solution|
  json.extract! solution, :brief
  json.url solution_url(solution, format: :json)
end
