class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @participations = Participation.all
    respond_with(@participations)
  end

  def show
    respond_with(@participation)
  end

  def new
    @game = Game.find(params[:game_id])
    @participation = @game.participations.new
    @users = User.excluding(@game.participating_users)
    respond_with(@participation)
  end

  def edit
  end

  def create
    @participation = Participation.new(participation_params)
    @participation.save
    redirect_to(new_participation_path)
  end

  def update
    @participation.update(participation_params)
    respond_with(@participation)
  end

  def destroy
    @participation.destroy
    respond_with(@participation)
  end

  private
    def set_participation
      @participation = Participation.find(params[:id])
    end

    def participation_params
      params.require(:participation).permit(:quiz_id, :user_id, :game_id)
    end
end
