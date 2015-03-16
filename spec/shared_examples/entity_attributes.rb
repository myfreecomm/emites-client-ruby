shared_examples "entity_attributes" do |attrs|
  attrs.each do |attr|
    it { is_expected.to have_attr_accessor(attr) }
  end
end