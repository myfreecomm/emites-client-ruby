require "bundler/gem_tasks"

begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
rescue LoadError
  # no rspec available
end

desc 'Open an irb session preloaded with this library'
task :console do
  sh "irb -rubygems -I lib -r emites.rb"
end
