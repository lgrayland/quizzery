class ParticipatonsController < ApplicationController
  before_action :set_participaton, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @participatons = Participaton.all
    respond_with(@participatons)
  end

  def show
    respond_with(@participaton)
  end

  def new
    @participaton = Participaton.new
    respond_with(@participaton)
  end

  def edit
  end

  def create
    @participaton = Participaton.new(participaton_params)
    @participaton.save
    respond_with(@participaton)
  end

  def update
    @participaton.update(participaton_params)
    respond_with(@participaton)
  end

  def destroy
    @participaton.destroy
    respond_with(@participaton)
  end

  private
    def set_participaton
      @participaton = Participaton.find(params[:id])
    end

    def participaton_params
      params.require(:participaton).permit(:quiz_id, :user_id)
    end
end
