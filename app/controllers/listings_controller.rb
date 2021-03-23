class ListingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @listing = Listing.new
    @listingList = Listing.where(user_id: current_user.id).paginate(page: params[:page], per_page: 3)
  end

  def show
    @listing = Listing.find(params[:id])
    @hostDetails = User.find(@listing.user_id)
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing .save
      flash[:notice] = 'Listing added successfully'
      redirect_to room_listing_url(@listing)
    else
      flash[:alert] = 'Failed to add Listing'
      redirect_to listings_url
    end
  end

  def room
    @listing = Listing.find(params[:id])
  end

  def price
    @listing = Listing.find(params[:id])
  end

  def description
    @listing = Listing.find(params[:id])
  end

  def photos
    @listing = Listing.find(params[:id])
  end

  def amenity
    @listing = Listing.find(params[:id])
  end

  def location
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @finalData = is_ready_to_publish(@listing) ? listing_params.merge(is_active: true) : listing_params
    if @listing.update_attributes(@finalData)
      flash[:notice] = 'Updated Listing Details!'
    else
      flash[:alert] = 'Update Failed!'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Listing.find(params[:id]).destroy
    flash[:alert] = 'Listing Deleted!'
    redirect_to properties_url
  end

  private
  def listing_params
    params.require(:listing).permit(
      :user_id,
      :listing_name,
      :home_type,
      :room_type,
      :price,
      :accomodate,
      :bedroom_count,
      :bathroom_count,
      :listing_description,
      :has_internet,
      :has_tv,
      :has_kitchen,
      :has_heating,
      :has_air_conditioning,
      :address,
    )
  end
  def is_ready_to_publish(listing)
    listing.address.present? && listing.listing_description.present? && listing.listing_name.present? && listing.price.present?
  end
end
