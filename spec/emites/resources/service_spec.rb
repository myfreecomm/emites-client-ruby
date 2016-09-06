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
        expect(entities).to be_a(Emites::Entities::Collection)
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
        expect(entities).to be_a(Emites::Entities::Collection)
        expect(entities.count).to eq(1)
        entities.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end

    it "returns empty" do
      VCR.use_cassette("services/search/returns_empty") do
        entities = subject.search({ name: "abc" })
        expect(entities).to be_a(Emites::Entities::Collection)
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

  describe '#calculate_liquid_amount' do
    it 'returns the liquid amount calculated based on service amount' do
      VCR.use_cassette('services/calculate_liquid_amount/success') do
        result = subject.calculate_liquid_amount(47, service_amount: 1000.0)

        expect(result.liquid_amount).to eql 938.50
      end
    end

    it 'returns error if service id is not found' do
      VCR.use_cassette('services/calculate_liquid_amount/error') do
        expect {
          subject.calculate_liquid_amount(12, service_amount: 1000.0)
        }.to raise_error(Emites::RequestError)
      end
    end

    it "returns error if attribute isn't found" do
      VCR.use_cassette('services/calculate_liquid_amount/attribute_error') do
        expect {
          subject.calculate_liquid_amount(47, service_value: 1000.0)
        }.to raise_error(Emites::RequestError)
      end
    end

    it "returns the same amount if taxes shouldn't be calculated" do
      VCR.use_cassette('services/calculate_liquid_amount/lower_amount') do
        result = subject.calculate_liquid_amount(47, service_amount: 100.0)

        expect(result.liquid_amount).to eql 100.0
      end
    end
  end
end
