class AnswerChoicesController < ApplicationController
  before_action :set_answer_choice, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @answer_choices = AnswerChoice.all
    respond_with(@answer_choices)
  end

  def show
    respond_with(@answer_choice)
  end

  def new
    @question = Question.find(params[:question_id])
    @answer_choice = @question.answer_choices.new
    respond_with(@answer_choice)
  end

  def edit
  end

  def create
    @answer_choice = AnswerChoice.new(answer_choice_params)
    @answer_choice.save
    respond_with(@answer_choice.question)
  end

  def update
    @answer_choice.update(answer_choice_params)
    respond_with(@answer_choice)
  end

  def destroy
    @answer_choice.destroy
    respond_with(@answer_choice)
  end

  private
    def set_answer_choice
      @answer_choice = AnswerChoice.find(params[:id])
    end

    def answer_choice_params
      params.require(:answer_choice).permit(:question_id, :answer, :correct)
    end
end
