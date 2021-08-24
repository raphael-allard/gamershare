require "rails_helper"

RSpec.describe ButtonComponent, type: :component do
  it "renders component" do
    render_inline(described_class.new(path: "/games/new",
                                      class_name: "button-class").with_content("I am a button"))

    expect(rendered_component).to have_text("I am a button")
    expect(rendered_component).to have_css(".button-class")
  end
end
