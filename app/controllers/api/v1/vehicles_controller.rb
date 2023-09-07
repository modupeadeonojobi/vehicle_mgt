class Api::V1::VehiclesController < ApplicationController
  before_action :authenticate_user! 

  def index
    @vehicles = current_user.vehicles
    render json: @vehicles
  end

  def create
    @vehicle = current_user.vehicles.new(vehicle_params)

    if @vehicle.save
      render json: @vehicle, status: :created
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  def update
    @vehicle = current_user.vehicles.find(params[:id])

    if @vehicle.update(vehicle_params)
      render json: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @vehicle = current_user.vehicles.find(params[:id])
    @vehicle.destroy
    head :no_content
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :state_id)
  end
end

