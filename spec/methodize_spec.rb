require 'spec_helper'

describe Resque::Plugins::Methodize do
  before :each do
    Resque.redis.flushdb
  end

  describe 'enqueuing' do
    it 'should contain a job after calling to enqueue' do
      TestJob.enqueue_sample1('test')
      Resque.size(:test).should == 1
    end

    it 'should enqueue with the expected parameters' do
      Resque::Job.should_receive(:create).with(:test, TestJob, "sample1", "test")
      TestJob.enqueue_sample1('test')
      Resque.size(:test).should == 0
    end
  end

  describe 'performing jobs' do
    before :each do
      Resque.redis.flushdb
      TestJob.enqueue_sample1('test')
      @job = Resque.reserve(:test)
    end

    it 'should contain a payload' do
      @job.payload_class.should == TestJob
      @job.payload['args'].should == ['sample1', 'test']
    end

    it 'should call the expected method when performed' do
      $performed_message = nil
      @job.perform
      $performed_message.should == 'test'
    end
  end
end
