class GivenAnswersController < ApplicationController
  before_action :set_given_answer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @given_answers = GivenAnswer.all
    respond_with(@given_answers)
  end

  def show
    respond_with(@given_answer)
  end

  def new
    @given_answer = GivenAnswer.new
    respond_with(@given_answer)
  end

  def edit
  end

  def create
    @given_answer = GivenAnswer.new(given_answer_params)
    @given_answer.save
    respond_with(@given_answer)
  end

  def update
    @given_answer.update(given_answer_params)
    respond_with(@given_answer)
  end

  def destroy
    @given_answer.destroy
    respond_with(@given_answer)
  end

  private
    def set_given_answer
      @given_answer = GivenAnswer.find(params[:id])
    end

    def given_answer_params
      params.require(:given_answer).permit(:participation_id, :quiz_question_id, :answer_choice_id)
    end
end
