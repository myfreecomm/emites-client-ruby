require "spec_helper"

describe Emites::Entities::Emitter do
  subject do
    described_class.new({
      name: "RSpec Subject",
      url:  "http://requestb.in/1mayrfq1"
    })
  end

  [
    :id, :account_id, :city, :certificate_filename,
    :email, :cnpj, :social_reason, :fancy_name,
    :state_inscription, :city_inscription,
    :neighborhood, :street, :number, :complement,
    :zip_code, :phone, :national_simple_optant,
    :cultural_promoter, :is_active,
    :environment, :latest_serie,
    :latest_number, :country_code, :street_type,
  ].each do |attr|
    it { is_expected.to have_attr_accessor(:street_type) }
  end
end
