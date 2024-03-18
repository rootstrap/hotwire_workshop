# frozen_string_literal: true

module Example
  class ComponentPreview < Lookbook::Preview
    def standard
      render Example::Component.new
    end
  end
end
