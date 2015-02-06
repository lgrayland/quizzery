json.array!(@quiz_questions) do |quiz_question|
  json.extract! quiz_question, :id, :quiz_id, :question_id, :position
  json.url quiz_question_url(quiz_question, format: :json)
end
