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
    else
      flash[:alert] = 'Failed to add Listing'
    end    
    redirect_to listings_url
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update_attributes(listing_params)
      flash[:notice] = 'Updated Listing Details!'
    else
      flash[:alert] = 'Update Failed!'
    end
    redirect_to @listing 
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
end
