class Api::V1::AppliesController < ApplicationController
  def index
    render json: Apply.all
  end

  def create
    apply = Apply.new(apply_params)
    if apply.save
      render json: apply, status: :created
    else
      render json: { errors: apply.errors }, status: :unprocessable_entity
    end
  end

  private

  def apply_params
    params.permit(:job_id, :geek_id, :read, :invited)
  end
end