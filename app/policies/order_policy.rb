class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.class == seller
        seller.orders
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
    true
  end

  def show?
    true
  end

end
