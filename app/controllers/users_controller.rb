class UsersController < ApplicationController
  before_action :user_signed_in?

  def show
    @user = User.find(params[:id])
  end

end
