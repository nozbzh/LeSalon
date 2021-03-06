class ProductGroupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.class == Seller
        user.product_groups
      else
        scope.all
      end
    end
  end

  #resolve uniquement pour index
  #ensuite pour toutes les autres fonctions

  def create?
    user.class == Seller
  end

  def edit?
    user.class == Seller
  end

  def update?
    user.class == Seller
  end

  def show?
    if user.class == Seller
      user.product_groups
    else
      scope.all
    end
  end

  def destroy?
    user.class == Seller
  end

end
