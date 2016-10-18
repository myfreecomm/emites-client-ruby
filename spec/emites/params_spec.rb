require "spec_helper"

describe Emites::Params do
  let(:permitted_params) { [:a, :b, :c] }
  subject { Emites::Params.new(permitted_params) }

  describe '#permit' do

    it 'filters a hash with string keys' do
      expect(Emites::Params.new({'a' => 1, 'b' => 2, 'd' => 3 }).permit(permitted_params)).to eq({ a: 1, b: 2 })
    end

    it 'filters a hash with symbol keys' do
      expect(Emites::Params.new(a: 1, b: 2, d: 3).permit(permitted_params)).to eq({ a: 1, b: 2 })
    end
  end
end
