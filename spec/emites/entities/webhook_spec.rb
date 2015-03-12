require "spec_helper"

describe Emites::Entities::Webhook do
  subject do
    described_class.new({
      name: "RSpec Subject",
      url:  "http://requestb.in/1mayrfq1"
    })
  end

  [:id, :name, :url].each do |attr|
    it { is_expected.to have_attr_accessor(attr) }
  end
end
