require 'thread'
module Kakegane
  ##
  # Main class for countdown latch behaviour
  class CountdownLatch
    ##
    # Create a new CountdownLatch
    #
    # @param [Integer] count the number of times #count_down must be called
    # @raise [ArgumentError] if not supplied a positive integer
    def initialize(count)
      raise ArgumentError unless count.is_a?(Fixnum) && count >= 0
      @count = count
      @mutex = Mutex.new
      @condition = ConditionVariable.new
    end

    ##
    # Decrement the count of the latch, releasing the waiting thread when count reaches zero
    # * If the count is greater than zero, the count is decremented by 1
    # * If the count is equal to zero, the thread is released
    def count_down
      @mutex.synchronize do
        @condition.signal if @count.zero?
        @count -= 1 if @count > 0
      end
    end

    ##
    # Returns the current count
    # @return [Integer]
    def count
      @mutex.synchronize { @count }
    end

    ##
    # Causes the current thread to wait until the latch has counted down to zero.
    # If the count is zero, it returns immediately
    # If the count is more than zero, the thread lies dormant for scheduling
    def wait
      @mutex.synchronize do
        @condition.wait @mutex if @count > 0
      end
    end
  end
end
