require "spec_helper"

describe Emites::Resources::Emitter do
  let(:http)          { Emites::Http.new("7A75E575CFDEDB91FF7E2CE22089181A") }
  let(:entity_klass)  { Emites::Entities::Emitter }

  subject { described_class.new(http) }

  it "has a instance of Emites::Http" do
    expect(subject.http).to eq http
  end

  describe "#create" do
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
        phone:            "2199999999",
        certificate:      Base64.encode64(File.read("spec/fixtures/certificate.pfx")),
        password:         "123456"
      }
    end

    it "creates an emitter" do
      VCR.use_cassette("emitters/create/success") do
        entity = subject.create(params.to_json)
        expect(entity).to be_a(entity_klass)
        expect(entity.cnpj).to eq(params[:cnpj])
      end
    end
  end

  describe "#info" do
    it "returns an Emitter instance where id is 4" do
      VCR.use_cassette("emitters/info/success") do
        entity = subject.info(4)
        expect(entity).to be_a(entity_klass)
        expect(entity.cnpj).to eq("17799377000155")
      end
    end
  end

  describe "#list" do
    it "returns an array of emitters" do
      VCR.use_cassette("emitters/list/success") do
        entities = subject.list
        expect(entities).to be_a(Array)
        entities.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#search" do
    it "returns an array of emitters where CNPJ is '17799377000155'" do
      VCR.use_cassette("emitters/search/success") do
        entities = subject.search({cnpj: "17799377000155"})
        expect(entities).to be_a(Array)
        expect(entities.count).to eq(1)
        entities.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#destroy" do
    it "deletes an emitter" do
      VCR.use_cassette("emitters/destroy/success") do
        result = subject.destroy(18)
        expect(result).to eq({})
      end
    end
  end
end
