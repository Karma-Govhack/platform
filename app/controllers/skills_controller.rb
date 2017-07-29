class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :update, :destroy]

  # GET /skill
  def index
    @skill = Skill.all
    render json: @skill, status: :ok
  end

  # POST /skill
  def create
    @skill = Skill.create!(skill_params)
    render json: @skill, status: :ok
  end

  # GET /skill/:id
  def show
    render json: @skill, status: :ok
  end

  # PUT /skill/:id
  def update
    @skill.update(skill_params)
    head :no_content
  end

  # DELETE /skill/:id
  def destroy
    @skill.destroy
    head :no_content
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
