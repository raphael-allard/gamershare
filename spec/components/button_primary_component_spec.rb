require "rails_helper"

RSpec.describe ButtonPrimaryComponent, type: :component do
  it "renders component" do
    render_inline(described_class.new(path: "/games/new").with_content("Add a game"))
    p rendered_component
    expect(rendered_component).to have_text "Add a game"
  end
end
