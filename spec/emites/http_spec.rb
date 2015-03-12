require "spec_helper"

describe Emites::Http do
  let(:token) { "t0k3n" }
  let!(:request) do
    class_spy(Typhoeus::Request).
      as_stubbed_const(transfer_nested_constants: true)
  end

  let!(:response) do
    Typhoeus::Response.new(return_code: :ok, code: 200, body: "OK")
  end

  before :each do
    Typhoeus.stub(/emites/).and_return(response)
    allow(Typhoeus::Request).to receive(:new).
      and_return(double :request, run: true, response: response)
  end

  subject { described_class.new(token) }

  shared_examples "verbs" do |verb|
    it "sends a #{verb.to_s.upcase} request to emites API" do
      subject.send(verb, "/some_resource")
      expect(request).to have_received(:new).
        with("https://sandbox.emites.com.br/api/v1/some_resource",
             method: verb,
             userpwd: "#{token}:x",
             headers:  {
                "Accept"      => "application/json",
                "Content-Type"  => "application/json",
                "User-Agent"  => Emites.configuration.user_agent
              }
            )
    end

    it "raise RequestTimeout when timed out" do
      response = Typhoeus::Response.new(return_code: :operation_timedout)
      Typhoeus.stub(/emites/).and_return(response)
      allow(Typhoeus::Request).to receive(:new).
        and_return(double :request, run: true, response: response)

      expect { subject.send(verb, "/some_resource") }.to raise_error(Emites::RequestTimeout)
    end

    it 'resquests error' do
      response = Typhoeus::Response.new(return_code: :ok, code: 500, body: "")
      Typhoeus.stub(/emites/).and_return(response)
      allow(Typhoeus::Request).to receive(:new).
        and_return(double :request, run: true, response: response)

      expect { subject.send(verb, '/some_resource') }.to raise_error(Emites::RequestError)
    end
  end

  describe "#get" do
    it_behaves_like "verbs", :get
  end

  describe "#post" do
    it_behaves_like "verbs", :post
  end

  describe "#put" do
    it_behaves_like "verbs", :put
  end

  describe "#patch" do
    it_behaves_like "verbs", :patch
  end

  describe "#delete" do
    it_behaves_like "verbs", :delete
  end

end
