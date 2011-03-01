$LOAD_PATH.unshift 'lib'

Gem::Specification.new do |s|
  s.name              = 'resque-methodize'
  s.version           = File.read('VERSION')
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = 'A Resque plugin that allows you to call individual methods on a Resque job'
  s.homepage          = 'http://github.com/krobertson/resque-methodize'
  s.email             = 'ken@invalidlogic.com'
  s.authors           = [ 'Ken Robertson' ]

  s.files             = %w( README.md Rakefile LICENSE )
  s.files            += Dir.glob("lib/**/*")

  s.extra_rdoc_files  = [ "LICENSE", "README.md" ]
  s.rdoc_options      = ["--charset=UTF-8"]

  s.add_dependency "resque", ">= 0.0.0"

  s.description = <<description
    Resque-Methodize is a plugin for the Resque job library that allows
    easy triggering of individual methods on a job class.
description
end
