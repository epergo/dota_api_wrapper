require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['spec/lib/dota_api_wrapper/*_spec.rb']
  t.verbose = true
end

task :console do
  exec 'pry -r dota_api_wrapper -I ./lib'
end

task default: :test
