class BookingsController < ApplicationController
  def create
    listing = Listing.find(params[:listing_id])
    check_in_date = Date.parse(booking_params[:check_in_date])
    check_out_date = Date.parse(booking_params[:check_out_date])
    number_of_nights = check_in_date == check_out_date ? 1 : (check_out_date - check_in_date).to_i

    total_computed_price = (number_of_nights * listing.price).to_i

    final_params = booking_params.merge(price: listing.price, total_price: total_computed_price)

    @booking = current_user.bookings.new(final_params)
    if @booking.save
      flash[:notice] = 'Booking Saved..'
    else
      flash[:alert] = 'Booking Failed.. Try again later'
    end
    redirect_back(fallback_location: root_path)
  end

  def bookings
  end

  private
  def booking_params
    params.require(:booking).permit(:listing_id, :check_in_date, :check_out_date)
  end
end
