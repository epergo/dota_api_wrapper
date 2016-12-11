# frozen_string_literal: true
require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['spec/lib/dota/*_spec.rb']
  t.verbose = false
end

task :console do
  exec 'pry -r dota -I ./lib'
end

task default: :test
