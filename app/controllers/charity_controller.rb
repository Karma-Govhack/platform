class CharityController < ApplicationController
  before_action :set_charity, only: [:show, :update, :destroy]

  # GET /charity
  def index
    @charity = Charity.all
    render json: @charity, status: :ok
  end

  # POST /charity
  def create
    @charity = Charity.create!(charity_params)
    render json: @charity, status: :ok
  end

  # GET /charity/:id
  def show
    render json: @charity, status: :ok
  end

  # PUT /charity/:id
  def update
    @charity.update(charity_params)
    head :no_content
  end

  # DELETE /charity/:id
  def destroy
    @charity.destroy
    head :no_content
  end

  private

  def charity_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_charity
    @charity = Charity.find(params[:id])
  end
end
