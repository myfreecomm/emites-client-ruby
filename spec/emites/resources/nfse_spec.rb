require "spec_helper"
require "time"

describe Emites::Resources::Nfse do
  let(:http)          { Emites::Http.new("7A75E575CFDEDB91FF7E2CE22089181A") }
  let(:entity_klass)  { Emites::Entities::Nfse }

  subject { described_class.new(http) }

  it "has a instance of Emites::Http" do
    expect(subject.http).to eq http
  end

  it_behaves_like "bound_notifiers", [:cancel, :destroy]

  describe "#list" do
    it "returns an array of Nfse" do
      VCR.use_cassette("nfse/list/success") do
        nfses = subject.list
        expect(nfses).to be_a(Array)
        nfses.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#info" do
    it "returns a Nfse instance where id is 456" do
      VCR.use_cassette("nfse/info/success") do
        nfse = subject.info(456)
        expect(nfse).to be_a(entity_klass)
        expect(nfse.serie). to eq("MYFC")
        expect(nfse.taker).to be_a(Emites::Entities::Taker)
      end
    end
  end

  describe "#status" do
    it "returns a Nfse instance status representation" do
      VCR.use_cassette("nfse/status/success") do
        nfse_status = subject.status(456)
        expect(nfse_status).to be_a(Emites::Entities::NfseStatus)
        expect(nfse_status.status).to eq("accepted")
        expect(nfse_status.description).to eq("Processado pela Sefaz")
      end
    end
  end

  describe "#history" do
    it "returns a Nfse instance status history" do
      VCR.use_cassette("nfse/history/success") do
        nfse_status_history = subject.history(456)
        expect(nfse_status_history).to be_a(Array)
        nfse_status_history.each do |e|
          expect(e).to be_a(Emites::Entities::NfseStatusTransition)
        end
      end
    end
  end

  describe "#pdf" do
    it "returns a Nfse pdf" do
      VCR.use_cassette("nfse/pdf/success") do
        pdf_url = subject.pdf(456)
        expect(pdf_url).to be_a(String)
        expect(pdf_url).to match(/https?/)
      end
    end
  end

  describe "#xml" do
    it "returns a Nfse xml" do
      VCR.use_cassette("nfse/xml/success") do
        xml_url = subject.xml(456)
        expect(xml_url).to be_a(String)
        expect(xml_url).to match(/https?/)
      end
    end
  end

  describe "#cancel" do
    it "cancels a Nfse" do
      VCR.use_cassette("nfse/cancel/success") do
        nfse = subject.cancel(456)
        expect(nfse).to be_a(Emites::Entities::NfseStatus)
        expect(nfse.status).to eq("cancelling")
      end
    end
  end

  describe "#destroy" do
    it "deletes a Nfse" do
      VCR.use_cassette("nfse/destroy/success") do
        result = subject.destroy(455)
        expect(result).to be_truthy
      end
    end
  end

  describe "#create" do
    let(:params) do
      {
        emitter_id:         4,
        rps_type:           1,
        serie:              "a",
        emission_date:      Time.now.utc.iso8601,
        operation_nature:   1,
        rps_situation:      1,
        service_values:     {
          service_amount:       1000.0,
          deduction_amount:     0,
          retained_iss:         false,
          calculation_base:     1000.0,
          iss_percentage:       5.00,
          iss_amount:           50.0,
          pis_amount:           0,
          cofins_amount:        0,
          inss_amount:          0,
          ir_amount:            0,
          csll_amount:          0,
          service_item_code:    "0105",
          city_tax_code:        "010501",
          description:          "RSPEC Servicos de informatica",
          city_code:            3304557,
          nfse_liquid_amount:   1000.0,
          discount_conditioning_amount: 0
        },
        taker:               {
          cpf:                  "83051507121",
          city_inscription:     "92708711",
          social_reason:        "Tomador RSPEC",
          address:      {
            street:             "Feijó Júnior",
            number:             "535",
            neighborhood:       "São Pelegrino",
            neighborhood_type:  "COM",
            city_code:          4305108,
            state:              "RS",
            zip_code:           95110550,
            city:               "Caxias do Sul"
          },
          contact:      {
            phone:              "32272144",
            ddd:                54
          }
        }
      }
    end

    it "creates a completely new Nfse" do
      VCR.use_cassette("nfse/create/success") do
        nfse   = subject.create(params)
        taker  = nfse.taker
        values = nfse.service_values

        expect(nfse).to be_a(entity_klass)

        expect(taker).to be_a(Emites::Entities::Taker)
        expect(taker.social_reason).to eq(params[:taker][:social_reason])

        expect(values).to be_a(Emites::Entities::NfseValues)
        expect(values.description).to eq(params[:service_values][:description])
      end
    end

    it "creates a Nfse where taker already exists" do
      VCR.use_cassette("nfse/create/given_taker") do
        params.delete(:taker)
        params[:taker_id] = 6

        nfse = subject.create(params)

        expect(nfse.taker).to be_a(Emites::Entities::Taker)
        expect(nfse.taker.social_reason).to eq("Fulano de Tal")
      end
    end

    it "creates a Nfse without a taker" do
      VCR.use_cassette("nfse/create/without_taker") do
        params.delete(:taker)

        nfse = subject.create(params)

        expect(nfse.taker).to be_nil
      end
    end
  end

end