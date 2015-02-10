class QuizQuestionsController < ApplicationController
  before_action :set_quiz_question, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @quiz_questions = QuizQuestion.all
    respond_with(@quiz_questions)
  end

  def show
    respond_with(@quiz_question)
  end

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @quiz_question = @quiz.quiz_questions.new
    @questions = Question.excluding(@quiz.questions)
    respond_with(@quiz_question)
  end

  def edit
  end

  def create
    @quiz_question = QuizQuestion.new(quiz_question_params)
    @quiz_question.save
    respond_with(@quiz_question.quiz)
  end

  def update
    @quiz_question.update(quiz_question_params)
    respond_with(@quiz_question)
  end

  def destroy
    @quiz_question.destroy
    respond_with(@quiz_question)
  end

  private
    def set_quiz_question
      @quiz_question = QuizQuestion.find(params[:id])
    end

    def quiz_question_params
      params.require(:quiz_question).permit(:quiz_id, :question_id, :position)
    end
end
