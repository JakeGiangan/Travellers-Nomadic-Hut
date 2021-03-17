class PropertiesController < ApplicationController
    before_action :authenticate_user!

  def index
    @property = Property.new
    @propertiesList = Property.where(host_id: current_user.id)
  end

  def show
    @property = Property.find(params[:id])
    @hostDetails = User.find(@property.host_id)
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:notice] = 'Property added successfully'
      redirect_to properties_url
    else
      flash[:alert] = 'Failed to add Property'
      redirect_to properties_url
    end
  end

  def update
    @property = Property.find(params[:id])
    if @property.update_attributes(property_params)
        flash[:notice] = "Updated Property Details!"
        redirect_to @property
    else
        flash[:alert] = "Update Failed!"
        redirect_to @property
    end
  end

  def destroy
    Property.find(params[:id]).destroy
    flash[:alert] = "Property Deleted!"
    redirect_to properties_url
  end

  private
  def property_params
    params.require(:property).permit(
      :host_id,
      :property_name,
      :property_type,
      :property_description,
      :check_in_time,
      :check_out_time,
      :rates,
      :service_fee,
      :cleaning_fee,
      :capacity,
      :wifi,
      :swimming_pool,
      :parking,
      :restaurant,
      :twenty_four_hour_front_desk,
      :fitness_center,
      :airport_transfer,
      :pay_upon_checkin,
      :family_friendly,
      :near_mrt_station,
      :no_cancellation_fee,
      :cancellation_fee,
      :cancellation_fee_price,
      :no_smoking,
      :pets_allowed,
      :no_parties,
      :other_rules,
      :other_rules_description,
      :smoke_alarm,
      :security_guards,
      :cctvs_equipped,
      :near_hospitals,
      :safety_deposit_box,
      :smoking_area,
      :twenty_four_hour_security,
      :elevator,
      :disabled_access_friendly
    )
  end
end
