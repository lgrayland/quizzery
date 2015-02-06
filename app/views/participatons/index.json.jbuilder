json.array!(@participatons) do |participaton|
  json.extract! participaton, :id, :quiz_id, :user_id
  json.url participaton_url(participaton, format: :json)
end
