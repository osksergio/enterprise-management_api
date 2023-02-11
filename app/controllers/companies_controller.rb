# frozen_string_literal: true

# controller Companies: multi-tenant pattern
class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update]

  # GET /companies
  def index
    service = Company::IndexCompany.call
    render json: service
  end

  # GET /companies/1
  def show
    service = Company::ShowCompany.call(params[:id])
    render json: service if service
  end

  # POST /companies
  def create
    service = Company::CreateCompany.call(company_params)

    if service.success?
      render json: service.company, status: :created
    else
      render json: { errors: service.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    service = Company::UpdateCompany.call(params)

    if service.success?
      render json: service.company, status: :ok
    else
      render json: { errors: service.errors, test: service.test }, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    id_deleted = params[:id]
    service = Company::DeleteCompany.call(id_deleted)

    if service.success?
      render json: { message: "Company was successfully destroyed (id: #{id_deleted}).", status: :ok }
    else
      render json: { errors: service.errors }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(:description, :email, :password)
  end
end
