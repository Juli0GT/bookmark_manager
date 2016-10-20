require "spec_helper"

describe Tag do
  subject(:tag) {described_class.new}
  it "has a name" do
    expect(tag).to respond_to(:name)
  end
  it "has an id" do
    expect(tag).to respond_to(:id)
  end
end
