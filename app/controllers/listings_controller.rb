class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_listing, except: [:new, :create, :index]

  def index
    @listing = Listing.new
    @listing_list = Listing.where(user_id: current_user.id).paginate(page: params[:page], per_page: 3)
  end

  def show
    @host_details = User.find(@listing.user_id)
    @carousel = @listing.images
    @listing_reviews = Review
                            .where("listing_id like #{@listing.id} and user_id != #{current_user.id}")
                            .joins('JOIN users ON users.id = reviews.user_id')
                            .paginate(page: params[:page], per_page: 3)
    @review_average = Review
                            .where("listing_id like #{@listing.id} and user_id != #{current_user.id}")
                            .joins('JOIN users ON users.id = reviews.user_id')
                            .average(:rating)
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      flash[:notice] = 'Listing added successfully'
      redirect_to room_listing_url(@listing)
    else
      flash[:alert] = 'Failed to add Listing'
      redirect_to listings_url
    end
  end

  def room
  end

  def price
  end

  def description
  end

  def photos
    @images = @listing.images

  end

  def amenity
  end

  def location
  end

  def update
    @final_data = is_ready_to_publish(@listing) ? listing_params.merge(is_active: true) : listing_params.merge(is_active: false)
    if @listing.update_attributes(@final_data)
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

  def check_current_bookings
    today = Date.today
    booking = @listing.bookings.where("check_in_date >= ? OR check_out_date >= ?", today, today)

    render json: booking
  end

  def review_booking
    check_in_date = Date.parse(params[:check_in_date])
    check_out_date = Date.parse(params[:check_out_date])

    result = { conflict: check_conflicts(check_in_date, check_out_date, @listing) }

    render json: result
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
      :address
    )
  end

  def fetch_listing
    @listing = Listing.find(params[:id])
  end

  def check_conflicts(check_in_date, check_out_date, listing)
    check = @listing.bookings.where('? < check_in_date AND check_out_date < ?', check_in_date, check_out_date)
    check.size > 0 ? true : false
  end
end
