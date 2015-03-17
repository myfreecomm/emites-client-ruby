require "spec_helper"

describe Emites do

  it "has a version number" do
    expect(Emites::VERSION).not_to be_nil
  end

  describe ".configuration" do
    it "is done via block initialization" do
      Emites.configure do |c|
        c.url = "http://some/where"
        c.user_agent = "My App v1.0"
      end
      expect(Emites.configuration.url).to eq "http://some/where"
      expect(Emites.configuration.user_agent).to eq "My App v1.0"
    end

    it "uses a singleton object for the configuration values" do
      config1 = Emites.configuration
      config2 = Emites.configuration
      expect(config1).to eq config2
    end
  end

  describe ".configure" do
    it "returns nil when no block given" do
      expect(Emites.configure).to eql(nil)
    end

    it "raise error if no method" do
      expect { Emites.configure do |c|
        c.user = "Bart"
      end }.to raise_error(NoMethodError)
    end
  end

  describe ".client" do
    subject { described_class.client("MYTOKEN") }

    it "returns an instance of Emites::Client" do
      expect(subject).to be_a(Emites::Client)
    end
  end

  describe ".subscribe" do
    class FakePublisher
      include Wisper::Publisher

      def apply
        publish("fake.event")
      end
    end

    it "notifies all listeners about an event occurrence" do
      listener = double("listener")
      expect(listener).to receive(:call).and_return(true)
      described_class.subscribe("fake.event", listener)
      FakePublisher.new.apply
    end
  end

end
