module Admin
  class OrdersController < ApplicationController
    def index
      @sellers = []
      Order.all.each do |order|
        @sellers << order.seller unless @sellers.include? order.seller
      end
    end
  end
end
