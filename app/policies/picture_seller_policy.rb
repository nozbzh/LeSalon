class PictureSellerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.class == Seller
        user.picture_sellers
      else
      scope.all
      end
    end
  end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    raise
    user.class == Seller
  end

end
