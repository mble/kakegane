require 'spec_helper'
module Kakegane
  describe CountdownLatch do
    context '#initialize' do
      it 'raises an error without arguments' do
        expect { CountdownLatch.new }.to raise_error ArgumentError
      end

      it 'raises an ArgumentError if argument is non-positive/non-integer' do
        expect { CountdownLatch.new(-1) }.to raise_error ArgumentError
        expect { CountdownLatch.new(1.0) }.to raise_error ArgumentError
        expect { CountdownLatch.new('a') }.to raise_error ArgumentError
      end
    end

    context '#count_down' do
      it 'decreases latch count when called' do
        latch = CountdownLatch.new 4
        expect { latch.count_down }.to change{ latch.count}.from(4).to 3
      end

      it 'does not reduce latch count below zero' do
        latch = CountdownLatch.new 0
        expect { latch.count_down }.not_to change { latch.count }
      end
    end

    context '#wait' do
      it 'waits for a thread to finish' do
        latch = CountdownLatch.new(2)

        Thread.new do
          latch.count_down
          latch.count_down
        end

        latch.wait
        expect(latch.count).to eq(0)
      end
    end
  end
end
