module Resque
  module Plugins
    module Methodize

      # Generic perform that calls to the specified method
      def perform(method, *args)
        self.new.send(method.to_sym, *args)
      end

      # Dynamic API for enqueuing jobs
      def method_missing(m, *args)
        super unless m.to_s =~ /^enqueue_/

        # Enqueue the specified method
        method = m.to_s.sub(/^enqueue_/, '')
        queue = self.instance_variable_get(:@queue) || (self.respond_to?(:queue) and self.queue)
        Resque::Job.create(queue, self, method, *args)
      end

    end
  end
end
