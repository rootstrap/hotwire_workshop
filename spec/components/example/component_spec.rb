# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Example::Component, type: :component do
  it 'renders component', :js do
    with_rendered_component_path(render_inline(described_class.new), layout: 'application') do |path|
      visit(path)

      expect(page).to have_text 'HTML works!'
      expect(page).to have_text 'CSS works!'
      expect(page).to have_text 'JS works!'
    end
  end
end
