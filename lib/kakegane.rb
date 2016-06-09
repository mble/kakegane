require 'kakegane/version'
require 'kakegane/countdown_latch'
module Kakegane
  def self.latch(count)
    Kakegane::CountdownLatch.new count
  end
end
