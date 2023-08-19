class Api::V1::PropertiesController < ApplicationController

  def index
    page = params[:page].to_i.positive? ? params[:page].to_i : 1
    per_page = params[:per_page].to_i.positive? ? params[:per_page].to_i : 10
  
    properties = filter_properties
    paginated_properties = properties.page(page).per(per_page)
  
    render_paginated_properties(paginated_properties)
  end
  
  
  def filter_properties
    if property_filter_params.present?
      Property.where(property_filter_params).order(created_at: :desc)
    else
      Property.order(created_at: :desc)
    end
  end
  
  def render_paginated_properties(properties)
    if properties.any?
      pagination_data = {
        total_pages: properties.total_pages,
        current_page: properties.current_page,
        per_page: properties.limit_value
      }
  
      render json: {
        status: 'SUCCESS',
        message: 'Properties loaded',
        data: properties,
        paging: pagination_data
      }
    else
      render json: { status: 'ERROR', message: 'No properties found', data: [] }
    end
  end
  



  def show
    property = Property.find_by(id: params[:id])

    if property
      render json: {status: 'SUCCESS', message:'Loaded property', data:property}
    else
      render json: {status: 'ERROR', message:'Property not found', data:{}}
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
      render json: { status: 'SUCCESS', message: 'Saved property', data: property }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Property not saved', error: property.errors }, status: :unprocessable_entity
    end
  end
  


  def update 
    property = Property.find(params[:id])

    if property.update(property_update_params)
      render json: {status: 'SUCCESS', message: 'Updated property', data: property},status: :ok
    else
      render json: {status: 'ERROR', message: 'Property not updated', error: property.errors},status: :unprocessable_entity
    end
  end

  
  private

  def property_params
    params.require(:property).permit(:property_address, :property_type, :number_of_bedrooms, :number_of_sitting_rooms, :number_of_kitchens, :number_of_bathrooms, :number_of_toilets, :property_owner, :description, :valid_from, :valid_to)
  end

  def property_update_params
    params.require(:property).permit(:number_of_bedrooms, :number_of_sitting_rooms, :number_of_kitchens, :number_of_bathrooms, :number_of_toilets, :description, :valid_to)
  end

  def property_filter_params
    params.permit(:property_owner, :number_of_bedrooms, :number_of_bathrooms)
  end

end
