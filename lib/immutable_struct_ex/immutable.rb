# frozen_string_literal: true

module ImmutableStructEx
  # Makes a struct immutable when extended.
  module Immutable
    class << self
      def extended(struct)
        [:[], *struct.members].each do |method|
          struct.instance_eval do
            undef :"#{method}="
          end
        end
      end
    end
  end
end
