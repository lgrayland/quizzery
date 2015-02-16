class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @games = Game.all
    respond_with(@games)
  end

  def show
    @participation = @game.participation_for(current_user)
    respond_with(@game)
  end

  def new
    @quizzes = Quiz.all
    @game = Game.new
    respond_with(@game)
  end

  def edit
  end

  def create
    @game = Game.new(game_params)
    @game.save
    redirect_to(new_game_participation_path(@game))
  end

  def update
    @game.update(game_params)
    respond_with(@game)
  end

  def destroy
    @game.destroy
    respond_with(@game)
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:quiz_id, :creator_id, :name)
    end
end
