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
    @participation = Participation.new
    respond_with(@participation)
  end

  def edit
  end

  def create
    @participation = Participation.new(participation_params)
    @participation.save
    respond_with(@participation)
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
      params.require(:participation).permit(:quiz_id, :user_id)
    end
end
