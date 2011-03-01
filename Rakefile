desc "Push a new version to Gemcutter"
task :publish do
  VERSION = File.read('VERSION').chomp

  sh "gem build resque-methodize.gemspec"
  sh "gem push resque-methodize-#{VERSION}.gem"
  sh "git tag v#{VERSION}"
  sh "git push origin v#{VERSION}"
  sh "git push origin master"
  sh "git clean -fd"
end

begin
  require 'spec/rake/spectask'

  desc "Run all specs"
  Spec::Rake::SpecTask.new('spec') do |t|
    t.rcov = false
    t.rcov_opts = %w{--exclude osx\/objc,gems\/,spec\/,features\/,rake\/,Gemfile,yaml,eval,FORWARDABLE,DELEGATE,jar --aggregate coverage.data}
    t.rcov_opts << %[-o "coverage"]
    t.spec_files = FileList['spec/**/*_spec.rb']
  end
rescue LoadError
  puts "RSpec (or a dependency) not available.  Install it with: gem install rspec -v 1.3.1"
end
