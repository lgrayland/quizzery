class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:show, :edit, :update, :destroy]
  before_action :set_game, only: [:new, :create]
  respond_to :html

  def index
    @participations = Participation.all
    respond_with(@participations)
  end

  def show
    @game = Game.find(params[:game_id])
    respond_with(@participation)
  end

  def new
    @participation = @game.participations.new
    @users = User.excluding(@game.participating_users)
    respond_with(@participation)
  end

  def edit
    @users = User.excluding(@participation.game.participating_users)
  end

  def create
    params[:user_ids].each do |user_id|
      @participation = @game.participations.create!(user_id: user_id)
    end
    if @participation.save
      redirect_to(game_participation_path(@game, @participation))
    else
      redirect_to :back
    end
  end

  def update
    @participation.update(participation_params)
    respond_with(@participation)
  end

  def destroy
    @participation.destroy
    redirect_to(authenticated_root_path)
  end

  private
    def set_game
      @game = Game.find(params[:game_id])
    end

    def set_participation
      @participation = Participation.find(params[:id])
    end

    def participation_params
      params.require(:participation).permit(:quiz_id, :user_id, :game_id)
    end
end
