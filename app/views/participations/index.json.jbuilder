json.array!(@participations) do |participation|
  json.extract! participation, :id, :quiz_id, :user_id
  json.url participation_url(participation, format: :json)
end
