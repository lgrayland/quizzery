class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :start]
  
  respond_to :html

  load_and_authorize_resource

  def start
    @game.play!
    redirect_to @game
  end

  def index
    @games = current_user.accessible_games
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
    @game.creator = current_user
    @game.save!
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
