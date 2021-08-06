# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  def initialize(path:, class_name:)
    @path = path
    @class_name = class_name
  end
end
