require "spec_helper"

describe Emites::Resources::Service do
  let(:http)          { Emites::Http.new("2C58AFD8E960A7BFE0BC912EBF47A960") }
  let(:entity_klass)  { Emites::Entities::Service }
  let(:params) do
    {
      emitter_id:       10,
      name:             "Serviços de informática",
      service_amount:   99.90
    }
  end

  subject { described_class.new(http) }

  it "has a instance of Emites::Http" do
    expect(subject.http).to eq http
  end

  it_behaves_like "bound_notifiers", [:create, :destroy]

  describe "#create" do
    it "creates a service" do
      VCR.use_cassette("services/create/success") do
        service = subject.create(params)
        expect(service).to be_a(entity_klass)
        expect(service.name).to eq(params[:name])
      end
    end

    it "returns RequestError" do
      VCR.use_cassette("services/create/error") do
        expect {
          subject.create({ service_amount:   99.90 })
        }.to raise_error(Emites::RequestError)
      end
    end
  end

  describe "#info" do
    it "returns a Service instance where id is 50" do
      VCR.use_cassette("services/info/success") do
        service = subject.info(50)
        expect(service).to be_a(entity_klass)
        expect(service.name).to eq("Serviços de informática")
      end
    end

    it "returns RequestError" do
      VCR.use_cassette("services/info/error") do
        expect {
          subject.info(51)
        }.to raise_error(Emites::RequestError)
      end
    end
  end

  describe "#list" do
    it "returns an array of services" do
      VCR.use_cassette("services/list/success") do
        entities = subject.list
        expect(entities).to be_a(Array)
        entities.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#search" do
    it "returns an array of services where name is 'Serviços de informática'" do
      VCR.use_cassette("services/search/success") do
        entities = subject.search({ name: "Serviços de informática" })
        expect(entities).to be_a(Array)
        expect(entities.count).to eq(1)
        entities.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end

    it "returns empty" do
      VCR.use_cassette("services/search/returns_empty") do
        entities = subject.search({ name: "abc" })
        expect(entities).to be_a(Array)
        expect(entities).to be_empty
      end
    end
  end

  describe "#destroy" do
    it "deletes a service" do
      VCR.use_cassette("services/destroy/success") do
        result = subject.destroy(50)
        expect(result).to be_truthy
      end
    end

    it "returns RequestError" do
      VCR.use_cassette("services/destroy/error") do
        expect {
          subject.destroy(51)
        }.to raise_error(Emites::RequestError)
      end
    end
  end
end
