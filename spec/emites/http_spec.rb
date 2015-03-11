require "spec_helper"
include Emites

describe Http do
  let(:token) { "t0k3n" }
  let!(:request) do
    class_spy(Typhoeus::Request).
      as_stubbed_const(transfer_nested_constants: true)
  end

  before :each do
    Typhoeus.stub(/emites/).and_return(Typhoeus::Response.new)
    allow(Typhoeus::Request).to receive(:new).
      and_return(double :request, run: true, response: OpenStruct.new(body: ""))
  end

  subject { Http.new(token) }

  describe "#get" do
    it "sends a GET request to emites API" do
      subject.get("/some_resource")
      expect(request).to have_received(:new).
        with("https://sandbox.emites.com.br/api/v1/some_resource",
             method: :get,
             userpwd: "#{token}:x",
            )
    end
  end
end
