require "spec_helper"

describe Emites::Entities::Emitter do
  let(:attributes) do
    {

    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [
    :id, :email, :social_reason, :cnpj, :fancy_name,
    :state_inscription, :city_inscription, :state, :city,
    :neighborhood, :street_type, :street, :number, :zip_code,
    :complement, :phone, :certificate, :password, :environment,
    :filename, :latest_serie, :latest_number, :code_tax_regime,
    :national_simple_optant, :cultural_promoter
  ]
end
