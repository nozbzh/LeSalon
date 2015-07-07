class OrderItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.class == user
        user.basket.basket_items
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
end
