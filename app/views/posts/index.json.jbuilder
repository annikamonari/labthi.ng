json.array!(@posts) do |post|
  json.extract! post, :id, :idea_build_id, :user_id, :title, :kind, :content, :image, :status, :likes
  json.url post_url(post, format: :json)
end
