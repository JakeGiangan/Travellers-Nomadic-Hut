class UsersController < ApplicationController
  def new
      @user = User.new
  end

  def create
  @user = User.new(user_params)
      if @user.save
      flash[:success] = "Sign-up Success!"
      redirect_to root_url
      else
      flash[:warning] = "Sign-up Failed"
      render 'new'
      end
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthdate, :languages, :email, :contact_number, :account_type, :password,
    :password_confirmation)
  end
end
