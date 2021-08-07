# frozen_string_literal: true

class DropdownComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end
end
