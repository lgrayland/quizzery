json.array!(@questions) do |question|
  json.extract! question, :id, :question, :type_id, :theme_id
  json.url question_url(question, format: :json)
end
