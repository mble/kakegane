require 'thread'
module Kakegane
  class CountdownLatch

    def initialize(count)
      raise ArgumentError unless count.is_a?(Fixnum) && count >= 0
      @count = count
      @mutex = Mutex.new
      @condition = ConditionVariable.new
    end

    def count_down
      @mutex.synchronize do
        @condition.signal if @count.zero?
        @count -= 1 if @count > 0
      end
    end

    def count
      @mutex.synchronize { @count }
    end

    def wait
      @mutex.synchronize do
        @condition.wait @mutex if @count > 0
      end
    end
  end
end
