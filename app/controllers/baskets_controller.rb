class BasketsController < ApplicationController
  skip_after_action :verify_policy_scoped
  before_action :authenticate_user!

  def index
    @basket = current_user.basket
  end
end
