class SearchController < ApplicationController
  include SearchHelper
  def search
    session[:address] = params[:search] if params.has_key?(:search)
    if check_if_filled?(session[:address])
      @search = Listing.where(is_active: true)
    else
      @bookings = Booking.where("check_in_date BETWEEN '#{params[:check_in_date]}' AND '#{params[:check_out_date]}'
                                AND check_out_date BETWEEN '#{params[:check_in_date]}' AND '#{params[:check_out_date]}'")
                          .pluck(:listing_id)
      @search = Listing.where(is_active: true).where.not(id: @bookings).near("#{session[:address]}", 5, order: 'distance')
    end

    if check_if_filled?(params[:check_in_date]) && check_if_filled?(params[:check_out_date])
      @bookings = Booking.where("check_in_date BETWEEN '#{params[:check_in_date]}' AND '#{params[:check_out_date]}'
                                AND check_out_date BETWEEN '#{params[:check_in_date]}' AND '#{params[:check_out_date]}'")
                        .pluck(:listing_id)
      @search = Listing.where(is_active: true).where.not(id: @bookings)
    end
    @search = @search.ransack(params[:q])
    @listing_list = @search.result(distinct: true).paginate(page: params[:page], per_page: 2)
  end
end
