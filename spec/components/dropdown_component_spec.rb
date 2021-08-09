require "rails_helper"

RSpec.describe DropdownComponent, type: :component do
  it "renders component" do
    render_inline(described_class.new(user: build(:user)))

    expect(rendered_component).to have_text "Log out"
  end
end
