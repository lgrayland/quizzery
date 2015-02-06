json.array!(@quizzes) do |quiz|
  json.extract! quiz, :id, :status
  json.url quiz_url(quiz, format: :json)
end
