class BillClientPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
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

  def confirmation?
    true
  end

end
