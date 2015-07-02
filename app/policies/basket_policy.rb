class BasketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # if user.class != Seller
      #   current_user.basket
      # else
      scope.all
    end
    # end
  end

  #resolve uniquement pour index
  #ensuite pour toutes les autres fonctions

  def index?
    true
  end

end
