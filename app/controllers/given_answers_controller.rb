class GivenAnswersController < ApplicationController
  
  respond_to :html

  def create
    game = Game.find(params[:game_id])

    participation = game.participation_for(current_user)

    given_answer = participation.given_answers.new(quiz_question_id: params[:quiz_question_id], answer_choice_id: params[:answer_choice_id], game_id: params[:game_id] )

    given_answer.save
    game.finish! if game.over?
      
    if given_answer.errors.any?
      messages = []
      given_answer.errors.full_messages.each do |message|
        messages.push(message)
      end
      flash[:alert] = messages.first  
    end
    respond_with(game)
  end
end
