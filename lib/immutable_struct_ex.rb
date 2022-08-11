require "immutable_struct_ex/version"

module ImmutableStructEx
  class << self
    def new(**options, &block)
      options_struct = Struct.new(*options.keys, keyword_init: true, &block)
      options_struct.new(**options).tap do |struct|
        [:[], *struct.members].each do |method|
          struct.instance_eval { undef :"#{method}=" }
        end
      end
    end
  end
end
