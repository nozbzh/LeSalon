class AddressesController < ApplicationController

  def create
    if @address.empty?
      @address = {
        delivery_address_street: current_user.address_street,
        delivery_address_zip: current_user.address_zip,
        delivery_address_city: current_user.delivery_address_city
      }
      @address.save
    else
      @address = current_user.bill_client.address.build(address_params)
      @address.save
    end
  end

  def update
    @address = Address.find(params[:id])
    authorize @address
    @address.update(address_params)
    redirect_to bill_client_path
  end

  private

  def address_params
    params.require(:address).permit(:delivery_address_street, :delivery_address_zip, :delivery_address_city)
  end

end
