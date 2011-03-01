require 'resque'
require File.dirname(__FILE__) + '/../lib/resque/plugins/methodize'

class TestJob
  extend Resque::Plugins::Methodize
  @queue = :test

  def sample1(message)
    $performed_message = message
  end
end
