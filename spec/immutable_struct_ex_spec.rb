# frozen_string_literal: true

RSpec.describe ImmutableStructEx, type: :module do
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
    it 'overrides :[]= and raises an error if used' do
      expect { subject[:key1] = :boom! }.to raise_error NoMethodError
    end
  end

  describe '#[]' do
    it 'can be accessed using :[]' do
      expect(hash.all? { |key, value| subject[key] == value }).to eq true
    end
  end

  describe 'getters/setters' do
    it 'defines getters from the hash keys' do
      expect(hash.keys.all? { |key| subject.respond_to? key }).to eq true
    end

    it 'undefines setters created from the hash keys' do
      expect(hash.keys.none? { |key| subject.respond_to? :"#{key}=" }).to eq true
    end
  end

  describe '#==' do
    context 'when the hash equivalent is ==' do
      it 'returns true' do
        expect(subject == hash).to eq true
      end
    end

    context 'when the hash equivalent is not ==' do
      context 'when the keys are different' do
        let(:not_equal_hash) { { unequal: :value1, unequal: :value2 } }

        it 'returns false' do
          expect(subject == not_equal_hash).to eq false
        end
      end

      context 'when the values are different' do
        let(:not_equal_hash) { { key1: :unequal, key2: :unequal } }

        it 'returns false' do
          expect(subject == not_equal_hash).to eq false
        end
      end
    end
  end

  context 'when passing a block' do
    subject do
      described_class.new(**hash) do
        def key?(key)
          to_h.key? key
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
