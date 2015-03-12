require "spec_helper"

describe Emites::Entities::Emitter do
  subject do
    described_class.new({
      name: "RSpec Subject",
      url:  "http://requestb.in/1mayrfq1"
    })
  end

  it { is_expected.to have_attr_accessor(:id) }
  it { is_expected.to have_attr_accessor(:account_id) }
  it { is_expected.to have_attr_accessor(:city) }
  it { is_expected.to have_attr_accessor(:certificate_filename) }
  it { is_expected.to have_attr_accessor(:email) }
  it { is_expected.to have_attr_accessor(:cnpj) }
  it { is_expected.to have_attr_accessor(:social_reason) }
  it { is_expected.to have_attr_accessor(:fancy_name) }
  it { is_expected.to have_attr_accessor(:state_inscription) }
  it { is_expected.to have_attr_accessor(:city_inscription) }
  it { is_expected.to have_attr_accessor(:neighborhood) }
  it { is_expected.to have_attr_accessor(:street) }
  it { is_expected.to have_attr_accessor(:number) }
  it { is_expected.to have_attr_accessor(:complement) }
  it { is_expected.to have_attr_accessor(:zip_code) }
  it { is_expected.to have_attr_accessor(:phone) }
  it { is_expected.to have_attr_accessor(:national_simple_optant) }
  it { is_expected.to have_attr_accessor(:cultural_promoter) }
  it { is_expected.to have_attr_accessor(:is_active) }
  it { is_expected.to have_attr_accessor(:environment) }
  it { is_expected.to have_attr_accessor(:latest_serie) }
  it { is_expected.to have_attr_accessor(:latest_number) }
  it { is_expected.to have_attr_accessor(:country_code) }
  it { is_expected.to have_attr_accessor(:street_type) }
end