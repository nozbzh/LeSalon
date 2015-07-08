module Users
  class BillClientsController < ApplicationController
    before_action :authenticate_user!

    def index
      @bill_clients = policy_scope(BillClient).order(created_at: :DESC)
      authorize @bill_clients
    end

    def show
      @bill_client = BillClient.find(params[:id])
      authorize @bill_client
    end

  end
end
