class GivenAnswersController < ApplicationController


  respond_to :html

  def create
    game = Game.find(params[:game_id])
    answer_choice = AnswerChoice.find(params[:answer_choice_id])
    quiz_question = QuizQuestion.find(params[:quiz_question_id])
    participation = game.participation_for(current_user)

    given_answer = participation.given_answers.new(quiz_question: quiz_question, answer_choice: answer_choice )

    given_answer.save
      
    if given_answer.errors.any?
      messages = []
      given_answer.errors.full_messages.each do |message|
        messages.push(message)
      end
      flash[:alert] = messages.first  
    end
    respond_with(game)
  end

  # private
  #   def given_answer_params
  #     params.permit(:participation_id, :quiz_question_id, :answer_choice_id)
  #   end
end
