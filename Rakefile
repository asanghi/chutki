#!/usr/bin/env rake
require "bundler/gem_tasks"

require "rubygems"
require "rake"
require "rake/testtask"
require "rdoc/task"

Rake::TestTask.new(:test) do |test|
  test.libs << "lib" << "test"
  test.pattern = "test/**/test_*.rb"
  test.verbose = true
end
task :default => :test