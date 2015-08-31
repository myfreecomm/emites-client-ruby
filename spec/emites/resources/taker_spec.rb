require "spec_helper"

describe Emites::Resources::Taker do
  let(:http)          { Emites::Http.new("2C58AFD8E960A7BFE0BC912EBF47A960") }
  let(:entity_klass)  { Emites::Entities::Taker }
  let(:params) do
    {
      email:            "wanderson.policarpo@myfreecomm.com.br",
      social_reason:    "My Fake, Inc",
      cnpj:             "01001001000113",
      fancy_name:       "My Fake",
      city_inscription: "3304557",
      state:            "RJ",
      city:             "3",
      neighborhood:     "Icaraí",
      street_type:      "RUA",
      street:           "Avenida Roberto Silveira - de 472 ao fim - lado par",
      number:           43,
      zip_code:         "24230-163",
      phone:            "2199999999"
    }
  end

  subject { described_class.new(http) }

  it "has a instance of Emites::Http" do
    expect(subject.http).to eq http
  end

  it_behaves_like "bound_notifiers", [:create, :destroy]

  describe "#create" do
    it "creates a taker" do
      VCR.use_cassette("takers/create/success") do
        taker = subject.create(params)
        expect(taker).to be_a(entity_klass)
        expect(taker.cnpj).to eq(params[:cnpj])
      end
    end

    it "returns RequestError" do
      VCR.use_cassette("takers/create/error") do
        expect {
          subject.create({ email: "email@example.com" })
        }.to raise_error(Emites::RequestError)
      end
    end
  end

  describe "#info" do
    it "returns a Taker instance where id is 135" do
      VCR.use_cassette("takers/info/success") do
        taker = subject.info(135)
        expect(taker).to be_a(entity_klass)
        expect(taker.cnpj).to eq("01001001000113")
      end
    end

    it "returns RequestError" do
      VCR.use_cassette("takers/info/error") do
        expect {
          subject.info(136)
        }.to raise_error(Emites::RequestError)
      end
    end
  end

  describe "#list" do
    it "returns an array of takers" do
      VCR.use_cassette("takers/list/success") do
        entities = subject.list
        expect(entities).to be_a(Array)
        entities.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#search" do
    it "returns an array of takers where CNPJ is '01001001000113'" do
      VCR.use_cassette("takers/search/success") do
        entities = subject.search({ cnpj: "01001001000113" })
        expect(entities).to be_a(Array)
        expect(entities.count).to eq(1)
        entities.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end

    it "returns empty" do
      VCR.use_cassette("takers/search/returns_empty") do
        entities = subject.search({ cnpj: "1775" })
        expect(entities).to be_a(Array)
        expect(entities).to be_empty
      end
    end
  end

  describe "#destroy" do
    it "deletes a taker" do
      VCR.use_cassette("takers/destroy/success") do
        result = subject.destroy(135)
        expect(result).to be_truthy
      end
    end

    it "returns RequestError" do
      VCR.use_cassette("takers/destroy/error") do
        expect {
          subject.destroy(136)
        }.to raise_error(Emites::RequestError)
      end
    end
  end
end
