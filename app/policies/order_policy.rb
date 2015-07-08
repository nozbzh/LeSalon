class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.class == Seller
        user.orders
      else
        scope.all
      end
    end
  end

  def index?
    if user.class == User
      true
    end

    if user.class == Seller
      true
    end

  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

end
