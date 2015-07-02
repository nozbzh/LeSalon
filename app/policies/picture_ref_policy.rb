class PictureRefPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    true
  end

  def create?
    user.class == Seller
  end

  def destroy?
    user.class == Seller
  end
end
