require "spec_helper"

describe Emites::Entities::NfseStatusTransition do
  let(:attributes) do
    {
      id:   1,
      token_description: "MY_T0KEN",
      from_status:       "created",
      to_status:         "scheduled",
      date:              "DateTime",
      emitter:           Emites::Entities::Emitter.new(id: 1, name: "MyFinance"),
      rps:               Emites::Entities::Rps.new(id: 6, number: 1950875687),
      account:           Emites::Entities::Account.new(id: 1, name: "MyFinance Account")
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [
    :id, :token_description, :from_status,
    :to_status, :date, :emitter, :rps, :account
  ]
end