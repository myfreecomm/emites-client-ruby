shared_examples "bound_notifiers" do |*hooked_methods|
  hooked_methods.flatten.each do |method|
    it "hooked up method #{method}" do
      expect(subject).to respond_to(method)
      expect(subject).to respond_to("#{method}_without_notifier")
    end
  end
end