class Api::V1::PropertiesController < ApplicationController
  def index
    properties = Property.order('created_at DESC')
    render json: {status: 'SUCCESS', message:'Loaded properties', data:properties}
  end


  def show
    property = Property.find_by(id: params[:id])

    if property
      render json: {status: 'SUCCESS', message:'Loaded property', data:property}
    else
      render json: {status: 'ERROR', message:'Property not found', data:{}}
    end
  end


  def filter_properties
    properties = Property.where(property_filter_params)

        if properties.present?
          render json: { status: 'SUCCESS', message: 'Filtered properties loaded', data: properties }
        else
          render json: { status: 'ERROR', message: 'No properties found for the given filters', data: [] }
        end
  end


  def get_by_address
    property = Property.find_by(property_address: params[:address])

    if property
      render json: {status: 'SUCCESS', message:'Loaded property', data:property}
    else
      render json: {status: 'ERROR', message:'Property not found', data:{}}
    end
  end


  def get_by_owner
    properties = Property.where(property_owner: params[:owner])

    if properties.present?
      render json: { status: 'SUCCESS', message: 'Loaded properties', data: properties }
    else
      render json: { status: 'ERROR', message: 'Properties not found', data: [] }
    end
  end


  def create
    property = Property.new(property_params)

    if property.save
      render json: {status: 'SUCCESS', message:'Saved property', data:property},status: :ok
    else
      render json: {status: 'ERROR', message:'Property not saved', data:property.errors},status: :unprocessable_entity
    end
  end


  def update 
    property = Property.find(params[:id])

    if property.update(property_update_params)
      render json: {status: 'SUCCESS', message:'Updated property', data:property},status: :ok
    else
      render json: {status: 'ERROR', message:'Property not updated', data:property.errors},status: :unprocessable_entity
    end
  end

  
  private

  def property_params
    params.permit(:property_address, :property_type, :number_of_bedrooms, :number_of_sitting_rooms, :number_of_kitchens, :number_of_bathrooms, :number_of_toilets, :property_owner, :description, :valid_from, :valid_to)
  end

  def property_update_params
    params.permit(:number_of_bedrooms, :number_of_sitting_rooms, :number_of_kitchens, :number_of_bathrooms, :number_of_toilets, :description, :valid_to)
  end

  def property_filter_params
    params.permit(:property_owner, :number_of_bedrooms, :number_of_bathrooms)
  end

end
