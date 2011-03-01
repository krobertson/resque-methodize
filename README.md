Resque Methodize
=================

Extends Resque to allow you to call individual methods on a job class.  This allows you to group common jobs in a single class rather than having multiple classes that differ slightly or more complex logic to handle variations within a single job.

For example:

    require 'resque/plugins/methodize'
    
    class MyJob
      extend Resque::Plugins::Methodize
      @queue = :jobs
      
      def sample1
        puts "Doing stuff"
      end
      
      def sample2(message)
        puts "Doing other stuff while #{message}"
      end
    end
    
    # Enqueue the job
    MyJob.enqueue_sample1
    MyJob.enqueue_sample2('taking out the garbage')

This allows a shorter notation for triggering jobs though "enqueue_*method*" and calling of a specific instance method within the job.

Inspiration
-----------

This plugin was inspired by the task framework cooked up at [Involver](http://involver.com) by [Mike Wadhera](http://github.com/mikewadhera).  The task framework, known as Queueable, is built on top of JMS and runs on JRuby.  It follows the same process of tasks being instance methods and similar notation for enqueuing.  I personally use Resque and wanted to bring that kind of notation and style to my usage of Resque.
