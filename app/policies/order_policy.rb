class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.class == Seller
        user.orders # ici user est = a seller, mais pundit ne connait que user
      else
        scope.all
      end
    end
  end

  def index?
    true
  end

  def pending_orders?
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

  def sent?
    true
  end
end
