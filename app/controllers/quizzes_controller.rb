class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @quizzes = current_user.created_quizzes
    respond_with(@quizzes)
  end

  def show
    respond_with(@quiz)
  end

  def new
    @quiz = Quiz.new
    respond_with(@quiz)
  end

  def edit
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.owner = current_user
    @quiz.save
    respond_with(@quiz)
  end

  def update
    @quiz.update(quiz_params)
    respond_with(@quiz)
  end

  def destroy
    @quiz.destroy
    respond_with(@quiz)
  end

  private
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    def quiz_params
      params.require(:quiz).permit(:name)
    end
end
