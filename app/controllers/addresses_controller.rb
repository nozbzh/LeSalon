class AddressesController < ApplicationController

  def create

    # if params[:existing_address]
    #   @address = current_user.bill_client.address.build(address_params)
    #   @address.user_id = 0
    # else
    #   @address = current_user.bill_client.address.build(address_params)
    # end

    # if @address
    #   @address.save
    # end

    @address = current_user.addresses.build(address_params)
    authorize @address

    @bill = find_bill_client

    if @address.save
      if @bill
        redirect_to bill_client_path(@bill)
      else
        redirect_to addresses_path
      end
    else
      if @bill
        render "bill_clients/show"
      else
        render :new
      end
    end
  end

  def update
    # @address = {
    #     delivery_address_street: current_user.address_street,
    #     delivery_address_zip: current_user.address_zip,
    #     delivery_address_city: current_user.delivery_address_city,
    #     user_id: 0
    #   }
    # @address.update(address_params)
    # authorize @address
    # redirect_to bill_client_path
  end

  private

  def address_params
    params.require(:address).permit(:delivery_address_street, :delivery_address_zip, :delivery_address_city)
  end

  def find_bill_client
    if params[:from] == "bill_client"
      return BillClient.where(status: 'pending').find(session[:bill_id])
    end
  end
end
