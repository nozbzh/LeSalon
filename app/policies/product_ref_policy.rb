class ProductRefPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.class == Seller
  end

  def edit?
    user.class == Seller
  end

  def update?
    user.class == Seller
  end

  def destroy?
    user.class == Seller
  end
end
