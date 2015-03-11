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

  describe "#get" do
    it "sends a GET request to emites API" do
      subject.get("/some_resource")
      expect(request).to have_received(:new).
        with("https://sandbox.emites.com.br/api/v1/some_resource",
             method: :get,
             userpwd: "#{token}:x",
             headers:  {
                "Accept"      => "application/json",
                "User-Agent"  => Emites.configuration.user_agent
              }
            )
    end
  end

  describe "#post" do
    pending
  end

  describe "#put" do
    pending
  end

  describe "#patch" do
    pending
  end

  describe "#delete" do
    pending
  end

end