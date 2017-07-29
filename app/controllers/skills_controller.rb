class SkillsController < ApplicationController
  before_action :set_skill, only: [:show]

  # GET /skill
  def index
    @skill = Skill.all
    render json: @skill, status: :ok
  end

  # GET /skill/:id
  def show
    render json: @skill, status: :ok
  end

  private

  def skill_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end
end
