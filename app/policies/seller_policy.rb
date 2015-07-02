class SellerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.class == Seller
        user.picture_sellers
      else
      scope.all
      end
    end
  end

  def show_to_user?
    true
  end

  def home?
    true
  end

  def profile?
    true
  end

end

