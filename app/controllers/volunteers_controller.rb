class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show, :update, :destroy]

  # GET /volunteer
  def index
    @volunteer = Volunteer.all
    @volunteer = @volunteer.map do |v|
      build_skills(v)
    end
    render json: @volunteer, methods: [:skills], status: :ok
  end

  # GET /volunteer/:id
  def show
    render json: @volunteer, methods: [:skills], status: :ok
  end

  private

  def volunteer_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_volunteer
    @volunteer = Volunteer.find(params[:id])
    build_skills(@volunteer)
  end

  def build_skills(vol)
      vol.skills =  vol.VolunteerAndSkills.map do |s|
        skill = Hash.new
        skill_row = Skill.find(s.Skill_id)
        skill['id'] = skill_row.id
        skill['name'] = skill_row.name 
        skill
      end
      vol
  end
end
