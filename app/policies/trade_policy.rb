class TradePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.asker == user || record.receiver == user
  end

  def create?
    record.asker == user
  end
end
