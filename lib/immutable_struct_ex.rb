# frozen_string_literal: true

require 'immutable_struct_ex/version'
require 'immutable_struct_ex/comparable'
require 'immutable_struct_ex/immutable'

# Defines the methods used to create/manage the ImmutableStructEx struct.
module ImmutableStructEx
  class << self
    def new(**hash, &block)
      Struct.new(*hash.keys, keyword_init: true, &block).tap do |struct|
        return struct.new(**hash).tap do |struct_object|
          struct_object.extend Comparable
          struct_object.extend Immutable
        end
      end
    end
  end
end
