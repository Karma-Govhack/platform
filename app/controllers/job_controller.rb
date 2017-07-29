class JobController < ApplicationController
  before_action :set_job, only: [:show, :update, :destroy]

  # GET /job
  def index
    @job = Job.all
    render json: @job, status: :ok
  end

  # POST /job
  def create
    @job = Job.create!(job_params)
    render json: @job, status: :ok
  end

  # GET /job/:id
  def show
    render json: @job, status: :ok
  end

  # PUT /job/:id
  def update
    @job.update(job_params)
    head :no_content
  end

  # DELETE /job/:id
  def destroy
    @job.destroy
    head :no_content
  end

  private

  def job_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
