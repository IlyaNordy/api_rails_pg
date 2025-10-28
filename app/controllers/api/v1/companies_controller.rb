class Api::V1::CompaniesController < ApplicationController
    def index
    render json: Company.all
  end

  def show
    company = Company.find(params[:id])
    render json: company, include: :jobs
  end
end
