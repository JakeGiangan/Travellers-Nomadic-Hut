class SearchController < ApplicationController
  include SearchHelper
  def search
    session[:address] = params[:search] if params.has_key?(:search)
    if check_if_filled?(session[:address])
      @search = Listing.where(is_active: true).near(session[:address], 5, order: 'distance')
    else
      @search = Listing.where(is_active: true)      
    end

    if check_if_filled?(params[:check_in_date]) && check_if_filled?(params[:check_out_date])
      @bookings = Booking.where("'#{params[:check_in_date]}' < check_in_date  AND check_out_date < '#{params[:check_out_date]}'")
                        .pluck(:listing_id)
      @search = @search.where.not(id: @bookings)
    end
    unless @search.nil?
      @review_average =  Review
                      .joins('JOIN bookings ON reviews.booking_id = bookings.id')
                      .joins('JOIN users ON users.id = reviews.user_id')
                      .where(id: @search.ids)
                      .where.not(user_id:current_user.id)
                      .pluck('AVG(rating)')
      @search = @search.ransack(params[:q])
      @listing_list = @search.result(distinct: true).paginate(page: params[:page], per_page: 2)
    end  
  end
end
