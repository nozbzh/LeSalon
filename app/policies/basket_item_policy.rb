class BasketItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
        scope
    end
  end

  #resolve uniquement pour index
  #ensuite pour toutes les autres fonctions

  def create?
    true
  end

end
