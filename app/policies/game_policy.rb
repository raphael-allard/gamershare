class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.includes(:owner).where.not(owner: user).order(updated_at: :desc)
    end
  end

  def new?
    true
  end
end
