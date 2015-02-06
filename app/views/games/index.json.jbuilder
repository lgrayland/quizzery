json.array!(@games) do |game|
  json.extract! game, :id, :quiz_id, :creator_id
  json.url game_url(game, format: :json)
end
