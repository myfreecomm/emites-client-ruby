require "spec_helper"

describe Emites::Resources::Webhook do
  let(:http)          { Emites::Http.new("7A75E575CFDEDB91FF7E2CE22089181A") }
  let(:entity_klass)  { Emites::Entities::Webhook }
  let(:params) do
    {
      url:  "http://requestb.in/1knsteq1",
      name: "My Fake Webhook"
    }
  end

  subject { described_class.new(http) }

  it "has a instance of Emites::Http" do
    expect(subject.http).to eq http
  end

  it_behaves_like "bound_notifiers", [:create, :update, :destroy]

  describe "#list" do
    it "returns an array of Webhooks" do
      VCR.use_cassette("webhooks/list/success") do
        webhooks = subject.list
        expect(webhooks).to be_a(Emites::Entities::Collection)
        webhooks.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#update" do
    it "returns an Webhook instance updated" do
      VCR.use_cassette("webhooks/update/success") do
        webhook = subject.update(15, {name: "RSpec integration"})
        expect(webhook).to be_a(entity_klass)
        expect(webhook.name).to eq("RSpec integration")
      end
    end
  end

  describe "#destroy" do
    it "returns true" do
      VCR.use_cassette("webhooks/destroy/success") do
        result = subject.destroy(14)
        expect(result).to be_truthy
      end
    end
  end

  describe "#create" do
    it "creates an webhook" do
      VCR.use_cassette("webhooks/create/success") do
        webhook = subject.create(params)
        expect(webhook).to be_a(entity_klass)
        expect(webhook.name).to eq(params[:name])
      end
    end
  end

end
