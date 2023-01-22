class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :destroy]

  # GET /companies
  def index
    @companies = Company.all

    render json: @companies
  end

  # GET /companies/1
  def show
    render json: @company
  end

  # POST /companies
  def create
    service = Company::Create.call(company_params)

    if service.success?
      render json: { message: 'Company created successfully!' }, status: :created
    else
      render json: { message: 'There was an error registering the company! :(' }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    id_deleted = params[:id]

    if @company.destroy
      render json: { message: "Company was successfully destroyed (id: #{id_deleted}).", status: :ok }
    else
      render json: @company.errors, status: :unprocessable_entity
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
