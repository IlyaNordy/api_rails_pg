class Api::V1::JobsController < ApplicationController
  before_action :set_job, only: [:show, :update, :destroy]

  def index
    if params[:company_id]
      @jobs = Company.find(params[:company_id]).jobs.where(deleted: false)
    else
      @jobs = Job.where(deleted: false)
    end
    render json: @jobs, each_serializer: JobSerializer, root: 'jobs'
  end

  def show
    render json: @job, serializer: JobSerializer
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      render json: @job, serializer: JobSerializer, status: :created
    else
      render json: { errors: @job.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @job.update(deleted: true)  # soft delete
    head :no_content
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.permit(:name, :place, :company_id)
  end
end