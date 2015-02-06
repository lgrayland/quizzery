json.array!(@given_answers) do |given_answer|
  json.extract! given_answer, :id, :participation_id, :quiz_question_id, :answer_choice_id
  json.url given_answer_url(given_answer, format: :json)
end
