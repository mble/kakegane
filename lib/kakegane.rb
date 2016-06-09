require 'kakegane/version'
require 'kakegane/countdown_latch'

##
# A naive implementation of a countdown latch to aid with cross thread
# synchronisation
#
# @author Matt Blewitt
#
# @example Count down from 5
#   latch = Kakegane.latch 5
#
#   Thread.new do
#     5.times do
#       sleep 1
#       latch.count_down
#     end
#   end
#
#   latch.wait
#
module Kakegane
  ##
  # Public API to create a new latch
  #
  # @param [Integer] count the number of times #count_down must be called
  # @raise [ArgumentError] if count is not a positive integer
  def self.latch(count)
    Kakegane::CountdownLatch.new count
  end
end
