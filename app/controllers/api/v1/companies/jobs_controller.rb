class Api::V1::Companies::JobsController < ApplicationController
    def index
    company = Company.find(params[:company_id])
    jobs = company.jobs.where(deleted: false)
    render json: jobs, each_serializer: JobSerializer
    end

    def show
    company = Company.find(params[:company_id])
    job = company.jobs.find(params[:id])
    render json: job, serializer: JobSerializer
    end
end