class JobController < ApplicationController
  before_action :set_job, only: [:show, :update, :destroy]

  # GET /job?user_id=?
  def index
    user_id = params[:user_id]
    volunteer = Volunteer.find(user_id)
    @job = Job.all.select do |j|
      getDistanceFromLatLonInKm(j.latitude, j.longtitude, volunteer.latitude, volunteer.longtitude) < 10
    end
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

  def getDistanceFromLatLonInKm(lat1,lon1,lat2,lon2)
    earth_radius = 6371 #Radius of the earth in km
    dLat = deg2rad(lat2-lat1)  #deg2rad below
    dLon = deg2rad(lon2-lon1)
    a = 
      Math.sin(dLat/2) * Math.sin(dLat/2) +
      Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * 
      Math.sin(dLon/2) * Math.sin(dLon/2) 
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    earth_radius * c #Distance in km
  end

  def deg2rad(deg)
    deg * (Math::PI/180)
  end

end
