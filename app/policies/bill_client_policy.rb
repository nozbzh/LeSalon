class BillClientPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.class == User
        user.bill_clients
      else
        scope
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

  def confirmation?
    true
  end

end
