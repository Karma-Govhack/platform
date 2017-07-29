class SectorController < ApplicationController
  before_action :set_sector, only: [:show]

  # GET /sector
  def index
    @sector = Sector.all
    render json: @sector, status: :ok
  end

  # GET /sector/:id
  def show
    render json: @sector, status: :ok
  end


  private

  def sector_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_sector
    @sector = Sector.find(params[:id])
  end
end
