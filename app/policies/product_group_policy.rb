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

  def show?
    user.class == User || record.seller == user
  end
end
