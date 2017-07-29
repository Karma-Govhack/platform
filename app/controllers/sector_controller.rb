class SectorController < ApplicationController
  before_action :set_sector, only: [:show, :update, :destroy]

  # GET /sector
  def index
    @sector = Sector.all
    render json: @sector, status: :ok
  end

  # POST /sector
  def create
    @sector = Sector.create!(sector_params)
    render json: @sector, status: :ok
  end

  # GET /sector/:id
  def show
    render json: @sector, status: :ok
  end

  # PUT /sector/:id
  def update
    @sector.update(sector_params)
    head :no_content
  end

  # DELETE /sector/:id
  def destroy
    @sector.destroy
    head :no_content
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
