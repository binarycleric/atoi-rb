require_relative "../lib/atoi"

RSpec.describe Atoi do
  include Atoi

  it "returns expected values for basic integers" do
    50.times.each do |n|
      expect(atoi(n.to_s)).to eql n
    end
  end

  it "strips leading zeros from numers" do
    expect(atoi("0000000000000001234")).to eql 1234
  end
end
