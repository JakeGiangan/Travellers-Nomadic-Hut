class SearchController < ApplicationController
  def search
    session[:address] = params[:search]
    @search = Listing.where(is_active: true)
    @search = @search.where(address: session[:address]) unless session[:address].blank?
    @search = @search.ransack(params[:q])
    @listing_list = @search.result(distinct: true).paginate(page: params[:page], per_page: 10)
  end
end
