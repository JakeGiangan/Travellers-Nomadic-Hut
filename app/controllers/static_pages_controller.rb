class StaticPagesController < ApplicationController
  def home
    @search = Listing.where(is_active: true).ransack(params[:q])
  end
end
