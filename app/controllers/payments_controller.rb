class PaymentsController < ApplicationController
  before_action :set_bill

    def new
      authorize @bill
    end

    def create
      @amount = @bill.amount_cents

      customer = Stripe::Customer.create(
        email:  current_user.email,
        card:   params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        customer:     customer.id,
        amount:       @amount,
        description:  "Payment for order #{@bill.id}",
        currency:     'eur'
      )

      authorize @bill

      @bill.update(payment: charge.to_json, status: 'payed')



      redirect_to bill_client_path(@bill)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_bill_client_payment_path(@bill)
    end

  private

    def set_bill
      #@bill = BillClient.where(status: 'pending').find(session[:bill_id])
      @bill = BillClient.find(session[:bill_id])
    end
end
