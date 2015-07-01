module SellerAccount
  class SellerPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope
      end
    end

    def home?
      true
    end
  end
end
