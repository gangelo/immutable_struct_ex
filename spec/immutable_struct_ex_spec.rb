RSpec.describe ImmutableStructEx do
  subject { described_class.new(**hash) }

  let(:hash) { { key1: :value1, key2: :value2 } }

  it 'has a version number' do
    expect(ImmutableStructEx::VERSION).not_to be nil
  end

  describe '#new' do
    context 'with a valid hash' do
      it 'does not raise an error' do
        expect { subject }.to_not raise_error
      end
    end
  end

  describe '#[]=' do
    it 'undefines :[]=' do
      expect(subject.respond_to? :[]=).to eq false
    end
  end

  describe '#[]' do
    it 'can be accessed using :[]' do
      expect(hash.keys.each.all? { |key, value| subject[key] == value })
    end
  end

  describe 'getters/setters' do
    it 'defines getters from the hash keys' do
      expect(hash.keys.all? { |key| subject.respond_to? key })
    end

    it 'undefines setters created from the hash keys' do
      expect(hash.keys.none? { |key| subject.respond_to? :"#{key}=" })
    end

    it 'sets the values using the setters' do
      expect(hash.keys.each.all? { |key, value| subject.public_send(key) == value })
    end
  end

  context 'when passing a block' do
    subject do
      described_class.new(**hash) do
        def key?(key)
          self.to_h.key? key
        end

        def key1?
          key? :key1
        end

        def key2?
          key? :key2
        end

        def key3?
          key? :key3
        end
      end
    end

    it 'uses the block' do
      expect(subject.key1?).to eq true
      expect(subject.key2?).to eq true
      expect(subject.key3?).to eq false
    end
  end
end
