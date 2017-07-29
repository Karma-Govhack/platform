class CharityController < ApplicationController
  before_action :set_charity, only: [:show]

  # GET /charity
  def index
    @charity = Charity.all
    render json: @charity, status: :ok
  end

  # GET /charity/:id
  def show
    render json: @charity, status: :ok
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
