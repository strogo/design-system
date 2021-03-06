# frozen_string_literal: true

module CoreExtension
  module Capybara
    module Node
      module Element
        def text(type = nil, normalize_ws: ::Capybara.default_normalize_ws)
          super(type, normalize_ws: normalize_ws)
        end

        def color
          native.css_value("color")
        end

        def background_color
          native.css_value("background-color")
        end

        def font_weight
          native.css_value("font-weight")
        end

        def vertical_position
          native.rect[:y]
        end
      end
    end
  end
end

Capybara::Node::Element.prepend CoreExtension::Capybara::Node::Element
