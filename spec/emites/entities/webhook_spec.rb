require "spec_helper"

describe Emites::Entities::Webhook do
  subject do
    described_class.new({
      name: "RSpec Subject",
      url:  "http://requestb.in/1mayrfq1"
    })
  end

  it { is_expected.to have_attr_accessor(:id) }
  it { is_expected.to have_attr_accessor(:name) }
  it { is_expected.to have_attr_accessor(:url) }
end