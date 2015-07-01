class SellerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show_to_user?
    true
  end

  def home?
    true
  end
end

