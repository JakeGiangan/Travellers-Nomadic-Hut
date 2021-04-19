class SearchController < ApplicationController
  def search
    session[:address] = params[:search] if params.has_key?(:search)
    @bookings = Booking.where("check_in_date BETWEEN '#{params[:check_in_date]}' AND '#{params[:check_out_date]}'
                            AND check_out_date BETWEEN '#{params[:check_in_date]}' AND '#{params[:check_out_date]}'")
                       .pluck(:listing_id)
    @search = Listing.where(is_active: true).where.not(id: @bookings).near("#{session[:address]}", 5, order: 'distance')
    @search = @search.ransack(params[:q])
    @listing_list = @search.result(distinct: true).paginate(page: params[:page], per_page: 2)
  end
end
