# frozen_string_literal: true

module ViewComponent
  module Storybook
    module Controls
      class ObjectConfig < SimpleControlConfig
        def type
          :object
        end

        def value_from_params(params)
          params_value = super(params)
          if params_value.is_a?(String)
            parsed_json = JSON.parse(params_value)
            if parsed_json.is_a?(Array)
              parsed_json.map do |item|
                item.is_a?(Hash) ? item.deep_symbolize_keys : item
              end
            else
              parsed_json.deep_symbolize_keys
            end
          else
            params_value
          end
        end
      end
    end
  end
end
