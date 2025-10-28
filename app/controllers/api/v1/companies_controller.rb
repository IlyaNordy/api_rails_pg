class Api::V1::CompaniesController < ApplicationController
  def index
    companies = Company.where(deleted: false)
    render json: companies, each_serializer: CompanySerializer
  end

  def show
    company = Company.find_by(id: params[:id], deleted: false)
    if company
        render json: company, serializer: CompanySerializer, include: :jobs
    else
        render json: { error: "Company not found" }, status: :not_found
    end
  end

  def create
    company = Company.new(company_params)
    if company.save
      render json: company, serializer: CompanySerializer, status: :created
    else
      render json: { errors: company.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    company = Company.find(params[:id])
    company.update(deleted: true)
    render json: { message: "Company marked as deleted" }, status: :ok
  end

  private

  def company_params
    params.permit(:name, :location)
  end
end