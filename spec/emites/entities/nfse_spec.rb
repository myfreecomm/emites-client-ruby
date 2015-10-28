require "spec_helper"

describe Emites::Entities::Nfse do
  let(:attributes) do
    {
      "_links" => [
        {
            "href" => "https://sandbox.emites.com.br/api/v1/nfse/1",
            "method" => "GET",
            "rel" => "self"
        }, {
            "href" => "https://sandbox.emites.com.br/api/v1/nfse/1",
            "method" => "DELETE",
            "rel" => "destroy"
        }, {
            "href" => "https://sandbox.emites.com.br/api/v1/nfse/1/status",
            "method" => "GET",
            "rel" => "status"
        }, {
            "href" => "https://sandbox.emites.com.br/api/v1/nfse/1/cancel",
            "method" => "POST",
            "rel" => "cancel"
        }, {
            "href" => "https://sandbox.emites.com.br/api/v1/nfse/1/xml",
            "method" => "GET",
            "rel" => "xml"
        }, {
            "href" => "https://sandbox.emites.com.br/api/v1/nfse/1/pdf",
            "method" => "GET",
            "rel" => "pdf"
        }, {
            "href" => "https://sandbox.emites.com.br/api/v1/nfse/1/history",
            "method" => "GET",
            "rel" => "history"
        }, {
            "href" => "https://sandbox.emites.com.br/nfse/show/1",
            "method" => "GET",
            "rel" => "html"
        }
      ],
      "taker" => {
          "address" => {
              "id" => 1,
              "street" => "Feijó Junior",
              "number" => "535",
              "complement" => "Sala 102",
              "neighborhood" => "Sao Pelegrino",
              "city_code" => 4305108,
              "state" => "RS",
              "zip_code" => 95110550,
              "street_type" => "RUA",
              "neighborhood_type" => "COM",
              "city" => "Caxias do Sul",
              "reference_point" => nil,
              "country" => "Brasil",
              "country_code" => "01058",
              "country_abbreviation" => "BR"
          },
          "contact" => {
              "id" => 1,
              "ddd" => 54,
              "phone" => "32272144",
              "email" => nil,
              "ddd_comercial_phone" => nil,
              "comercial_phone" => nil,
              "ddd_fax" => nil,
              "fax_phone" => nil
          },
          "id" => 1,
          "cpf" => 44423739577,
          "cnpj" => nil,
          "city_inscription" => 92708711,
          "social_reason" => "Razão Social do Tomador",
          "fancy_name" => nil,
          "state_inscription" => nil,
          "substitute_state_inscription" => nil,
          "special_situation" => 0,
          "foreign_taker" => false
      },
      "xml" => nil,
      "service_values" => {
          "id" => 1,
          "service_amount" => "99.9",
          "deduction_amount" => "0",
          "retained_iss" => false,
          "calculation_base" => "99.9",
          "iss_percentage" => "5.00",
          "iss_amount" => "4.99",
          "pis_amount" => "0",
          "cofins_amount" => "0",
          "inss_amount" => "0",
          "ir_amount" => "0",
          "csll_amount" => "0",
          "discount_conditioning_amount" => "0",
          "service_item_code" => "0105",
          "cnae_code" => nil,
          "description" => "Servicos de informatica",
          "city_code" => 3304557,
          "nfse_liquid_amount" => "109.9",
          "city_tax_code" => "010501",
          "other_retentions_amount" => "0.00",
          "retained_iss_amount" => "0.00",
          "unconditioned_discount_amount" => "0.00"
      },
      "substitute_rps" => nil,
      "errors" => [],
      "id" => 1,
      "emitter_id" => 1,
      "status" => "processing",
      "description" => "Aguardando processamento pela Sefaz",
      "nfse_key" => nil,
      "nfse_number" => nil,
      "nfse_xml" => nil,
      "number" => 370851823,
      "serie" => "a",
      "rps_type" => 1,
      "emission_date" => "2014-03-18T08:34:56Z",
      "operation_nature" => 1,
      "rps_situation" => 1,
      "other_informations" => nil,
      "competence" => nil,
      "special_regime" => nil,
      "is_complete" => true
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [
    :id, :emitter_id, :taker, :rps_situation, :serie,
    :number, :rps_type, :emission_date,
    :emission_date_nfse, :operation_nature, :other_informations,
    :competence, :special_regime, :status,
    :description, :send_nfse_taker, :service_values,
    :_links
  ]

  describe "#url" do
    it "returns an action endpoint" do
      expect(subject.url("self")).to eq("https://sandbox.emites.com.br/api/v1/nfse/1")
    end

    it "returns an empty string if action is invalid" do
      expect(subject.url("fake-action")).to eq("")
    end
  end

end