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

  def approved?
    index?
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

  def approve?
    user.admin? && record.approved == false
  end

  def unapprove?
    user.admin? && record.approved == true
  end
end

