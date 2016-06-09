require 'spec_helper'

describe Kakegane do
  it 'has a version number' do
    expect(Kakegane::VERSION).not_to be nil
  end

  context '.latch' do
    it 'returns a new Kakegane::CountdownLatch' do
      latch = Kakegane.latch 1
      expect(latch).to be_a Kakegane::CountdownLatch
    end

    it 'raises an error without arguments' do
      expect { Kakegane.latch }.to raise_error ArgumentError
    end
  end
end
