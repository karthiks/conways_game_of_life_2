require "bundler/gem_tasks"

require "rake"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = %w(--color --format progress)
end

task :default => :spec
