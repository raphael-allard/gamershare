class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.order(updated_at: :desc)
    end
  end

  def new?
    true
  end
end
