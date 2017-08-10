require 'rake'
require 'rspec/core/rake_task'
require 'json'
require 'pathname'
require 'rainbow'
require 'rspec/core/rake_task'
require 'uri'

desc 'Run serverspec tests'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/full_spec.rb'
end

desc 'Validate vault write'
RSpec::Core::RakeTask.new(:step1) do |t|
  t.pattern = 'spec/step-1_spec.rb'
end

desc 'Validate vault read'
RSpec::Core::RakeTask.new(:step2) do |t|
  t.pattern = 'spec/step-2_spec.rb'
end

desc 'Validate vault update'
RSpec::Core::RakeTask.new(:step3) do |t|
  t.pattern = 'spec/step-3_spec.rb'
end

desc 'Validate vault delete'
RSpec::Core::RakeTask.new(:step4) do |t|
  t.pattern = 'spec/step-4_spec.rb'
end
