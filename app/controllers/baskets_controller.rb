class BasketsController < ApplicationController
  skip_after_action :verify_authorized

  def index
    @basket = policy_scope(Basket)
    @basket = current_user.basket
  end
end
