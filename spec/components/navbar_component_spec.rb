require "rails_helper"

RSpec.describe NavbarComponent, type: :component do
  it "renders component" do
    render_inline(described_class.new(user: build(:user)))

    expect(rendered_component).to have_text "GamerShare"
  end
end
