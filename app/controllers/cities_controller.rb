class CitiesController < ApplicationController
  before_action :set_city, only: %i[show update]

  # GET /cities
  def index
    service = Company::IndexCompany.call
    render json: service
  end

  # GET /cities/1
  def show
    service = City::ShowCity.call(params[:id])
    render json: service if service
  end

  # POST /cities
  def create
    service = City::CreateCity.call(city_params)

    if service.success?
      render json: service.city, status: :created
    else
      render json: { errors: service.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cities/1
  def update
    service = City::UpdateCity.call(params)

    if service.success?
      render json: service.city, status: :ok
    else
      render json: { errors: service.errors, test: service.test }, status: :unprocessable_entity
    end
  end

  # DELETE /cities/1
  def destroy
    id_deleted = params[:id]
    service = City::DeleteCity.call(id_deleted)

    if service.success?
      render json: { message: "City was successfully destroyed (id: #{id_deleted}.", status: :ok }
    else
      render json: { errors: service.errors }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_city
    @city = City.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def city_params
    params.require(:city).permit(:description, :state, :company_id)
  end
end
