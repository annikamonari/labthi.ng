json.array!(@questions) do |question|
  json.extract! question, :title, :brief, :answers_expected, :idea_id, :user_id
  json.url question_url(question, format: :json)
end
