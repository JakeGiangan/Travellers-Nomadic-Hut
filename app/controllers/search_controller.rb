class SearchController < ApplicationController
  def search
    session[:address] = params[:search] if params.has_key?(:search)
    if session[:address].present? && session[:address].empty? == false
      @search = Listing.where(is_active: true)
      if params[:check_in_date].present? && params[:check_in_date].empty? == false && params[:check_out_date].present? && params[:check_out_date].empty? == false 
        @bookings = Booking.where("check_in_date BETWEEN '#{params[:check_in_date]}' AND '#{params[:check_out_date]}'
                AND check_out_date BETWEEN '#{params[:check_in_date]}' AND '#{params[:check_out_date]}'")
          .pluck(:listing_id)
        @search = Listing.where(is_active: true).where.not(id: @bookings)
      end
    else
      @bookings = Booking.where("check_in_date BETWEEN '#{params[:check_in_date]}' AND '#{params[:check_out_date]}'
                                AND check_out_date BETWEEN '#{params[:check_in_date]}' AND '#{params[:check_out_date]}'")
                          .pluck(:listing_id)
      @search = Listing.where(is_active: true).where.not(id: @bookings).near("#{session[:address]}", 5, order: 'distance')
    end

    @search = @search.ransack(params[:q])
    @listing_list = @search.result(distinct: true).paginate(page: params[:page], per_page: 2)
  end
end
