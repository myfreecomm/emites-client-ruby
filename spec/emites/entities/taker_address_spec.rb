require "spec_helper"

describe Emites::Entities::TakerAddress do
  let(:attributes) do
    {

    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [
    :street, :number, :complement, :neighborhood,
    :city_code, :state, :zip_code, :street_type,
    :neighborhood_type, :city, :reference_point,
    :country, :country_code, :country_abbreviation
  ]
end