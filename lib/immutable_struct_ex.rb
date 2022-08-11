require "immutable_struct_ex/version"

module ImmutableStructEx
  class << self
    def new(**hash, &block)
      options_struct = Struct.new(*hash.keys, keyword_init: true, &block)
      options_struct.new(**hash).tap do |struct|
        [:[], *struct.members].each do |method|
          struct.instance_eval { undef :"#{method}=" }
        end
      end
    end
  end
end
