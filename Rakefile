require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['spec/lib/dota_api_wrapper/*_spec.rb']
  t.verbose = true
end

task :default => :test
