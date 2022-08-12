# frozen_string_literal: true

require 'immutable_struct_ex/version'

# Defines the methods used to create/manage the ImmutableStructEx struct.
module ImmutableStructEx
  class << self
    def new(**hash, &block)
      options_struct = Struct.new(*hash.keys, keyword_init: true, &block)
      options_struct.new(**hash).tap do |struct|
        [:[], *struct.members].each do |method|
          evaluate(struct) do
            <<~RUBY
              undef :"#{method}="
            RUBY
          end
        end
        evaluate(struct) do
          <<~RUBY
            def ==(object)
              return false unless object.respond_to? :to_h

              to_h == object.to_h
            end
          RUBY
        end
      end
    end

    def evaluate(struct)
      struct.instance_eval yield
    end
  end
end
