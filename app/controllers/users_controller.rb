class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:address_street, :address_zip, :address_city, :first_name, :last_name, :phone_number, :email)
  end
end
