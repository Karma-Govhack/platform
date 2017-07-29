class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show, :update, :destroy]

  # GET /volunteer
  def index
    @volunteer = Volunteer.all
    render json: @volunteer, methods: [:skills], status: :ok
  end

  # POST /volunteer
  def create
    @volunteer = Volunteer.create!(volunteer_params)
    render json: @volunteer, status: :ok
  end

  # GET /volunteer/:id
  def show
    render json: @volunteer, methods: [:skills], status: :ok
  end

  # PUT /volunteer/:id
  def update
    @volunteer.update(volunteer_params)
    head :no_content
  end

  # DELETE /volunteer/:id
  def destroy
    @volunteer.destroy
    head :no_content
  end

  private

  def volunteer_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_volunteer
    @volunteer = Volunteer.find(params[:id])
    @volunteer.skills =  @volunteer.VolunteerAndSkills.map do |s|
      skill = Hash.new
      skill_row = Skill.find(s.Skill_id)
      skill['id'] = skill_row.id
      skill['name'] = skill_row.name 
      skill
    end
  end
end
