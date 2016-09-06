require 'spec_helper'

describe Emites::Entities::Collection do
  let(:json) { File.read('spec/fixtures/nfse_list.json') }
  let(:response) { double(parsed_body: MultiJson.load(json)) }

  subject { described_class.new(response, Emites::Entities::Nfse) }

  describe '#build' do
    it 'returns self' do
      expect(subject.build).to eq(subject)
    end

    it 'builds a nfse collection' do
      expect(subject.build.count).to eq(3)
      expect(subject.build.first.class).to eq(Emites::Entities::Nfse)
    end
  end

  describe '#next_page' do
    it 'returns next page (3)' do
      expect(subject.next_page).to eq(3)
    end

    context 'when there is no next page' do
      let(:response) { double(parsed_body: {}) }

      it 'returns nil' do
        expect(subject.next_page).to be_nil
      end
    end
  end

  describe '#previous_page' do
    it 'returns previous page (1)' do
      expect(subject.previous_page).to eq(1)
    end

    context 'when there is no previous page' do
      let(:response)  { double(parsed_body: {}) }

      it 'returns nil' do
        expect(subject.previous_page).to be_nil
      end
    end
  end

  describe '#total' do
    it 'returns one thousand' do
      expect(subject.total).to eq(1000)
    end
  end
end

