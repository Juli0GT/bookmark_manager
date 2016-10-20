require 'spec_helper'

describe Link do
  subject(:link) { described_class.new }

  it 'should have a link' do
    expect(link).to respond_to(:url)
  end

  it 'shoudl have a title' do
    expect(link).to respond_to(:title)
  end

  it 'should have an id' do
    expect(link).to respond_to(:id)
  end
end
