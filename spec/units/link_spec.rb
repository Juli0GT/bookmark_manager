require 'spec_helper'

describe Link do
  subject(:link) { described_class.new }

  let(:tag) { double("tag", name: "#cake")}

  it 'should have a link' do
    expect(link).to respond_to(:url)
  end

  it 'shoudl have a title' do
    expect(link).to respond_to(:title)
  end

  it 'should have an id' do
    expect(link).to respond_to(:id)
  end

  it "can print its tags" do
    allow(link).to receive_messages(tags: [tag, tag, tag])
    expect(link.print_tags).to eq "#cake #cake #cake "
  end
end
