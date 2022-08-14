# frozen_string_literal: true

module ImmutableStructEx
  # Makes a struct comparable with another struct or hash when extended.
  module Comparable
    class << self
      def extended(struct)
        struct.instance_eval do
          def ==(other)
            return false unless other.is_a?(Hash) || other.is_a?(Struct)

            to_h == other.to_h
          end
        end
      end
    end
  end
end
