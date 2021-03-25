class SearchesController < ApplicationController
  def index
    @listing_list = Listing.where(is_active: true).paginate(page: params[:page], per_page: 3)
  end
end
