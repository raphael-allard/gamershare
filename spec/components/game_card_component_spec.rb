require "rails_helper"

RSpec.describe GameCardComponent, type: :component do
  it "renders component" do
    render_inline(described_class.new(game: create(:game)))

    expect(rendered_component).to have_text "Mega Man X"
  end
end
