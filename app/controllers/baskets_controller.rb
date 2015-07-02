class BasketsController < ApplicationController
  skip_after_action :verify_authorized
  before_action :authenticate_user!

  def index
    @basket = policy_scope(Basket)
    @basket = current_user.basket
  end
end
