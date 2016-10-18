require "spec_helper"

describe Emites::Response do

  subject { described_class.new(response) }

  describe "#resolve!" do
    context 'when successful' do
      let(:response) { double(success?: true, timed_out?: false) }

      it 'returns self' do
        expect(subject.resolve!).to eq(response)
      end

      context 'when block given' do
        it 'returns block' do
          expect(subject.resolve!{ response }).to eq(response)
        end
      end
    end

    context 'when redirected' do
      let(:response) { double(success?: false, timed_out?: false, code: 301) }

      it 'returns self' do
        expect(subject.resolve!).to eq(response)
      end

      context 'when block given' do
        it 'returns block' do
          expect(subject.resolve!{ response }).to eq(response)
        end
      end
    end

    context 'when timed out' do
      let(:response) { double(success?: false, timed_out?: true) }

      it 'raises RequestTimeout' do
        expect { subject.resolve! }.to raise_error(Emites::RequestTimeout)
      end
    end

    context 'when in error' do
      let(:response) { double(success?: false, timed_out?: false, code: 418, status_message: "I'm a teapot",
        body: %Q({"error": "Unable to comply with brew coffee request"})) }

      it 'raises RequestError' do
        expect { subject.resolve! }.to raise_error do |error|
          expect(error).to be_a(Emites::RequestError)
          expect(error.code).to eq(418)
          expect(error.message).to eq("I'm a teapot")
          expect(error.body).to eq({ "error" => "Unable to comply with brew coffee request" })
        end
      end
    end
  end

  describe '#redirected?' do
    let(:response) { double(success?: false, timed_out?: false, code: 301) }

    context 'when http status is 3xx' do
      it 'is true' do
        expect(subject.redirected?).to be_truthy
      end
    end

    context 'when http status is 2xx' do
      before { allow(response).to receive(:code).and_return(200) }
      it 'is false' do
        expect(subject.redirected?).to be_falsy
      end
    end

    context 'when http status is 4xx' do
      before { allow(response).to receive(:code).and_return(422) }
      it 'is false' do
        expect(subject.redirected?).to be_falsy
      end
    end
  end

  describe "#parsed_body" do
    let(:response) { double(success?: true) }

    context "when JSON is invalid" do
      it "returns empty hash" do
        allow(subject).to receive(:body).and_return(%Q({"key": ))
        expect(subject.parsed_body).to eq({})
      end
    end

    context "when JSON is valid" do
      it "returns empty hash" do
        allow(subject).to receive(:body).and_return(%Q({"key": "value"}))
        expect(subject.parsed_body).to eq({ "key" => "value" })
      end
    end
  end
end
