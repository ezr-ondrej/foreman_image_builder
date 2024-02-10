require 'rake/testtask'

# Tasks
namespace :foreman_image_builder do
  namespace :example do
    desc 'Example Task'
    task task: :environment do
      # Task goes here
    end
  end
end

# Tests
namespace :test do
  desc 'Test ForemanImageBuilder'
  Rake::TestTask.new(:foreman_image_builder) do |t|
    test_dir = File.expand_path('../../test', __dir__)
    t.libs << 'test'
    t.libs << test_dir
    t.pattern = "#{test_dir}/**/*_test.rb"
    t.verbose = true
    t.warning = false
  end
end

namespace :foreman_image_builder do
  task :rubocop do
    begin
      require 'rubocop/rake_task'
      RuboCop::RakeTask.new(:rubocop_foreman_image_builder) do |task|
        task.patterns = ["#{ForemanImageBuilder::Engine.root}/app/**/*.rb",
                         "#{ForemanImageBuilder::Engine.root}/lib/**/*.rb",
                         "#{ForemanImageBuilder::Engine.root}/test/**/*.rb"]
      end
    rescue
      puts 'Rubocop not loaded.'
    end

    Rake::Task['rubocop_foreman_image_builder'].invoke
  end
end

Rake::Task[:test].enhance ['test:foreman_image_builder']

load 'tasks/jenkins.rake'
if Rake::Task.task_defined?(:'jenkins:unit')
  Rake::Task['jenkins:unit'].enhance ['test:foreman_image_builder', 'foreman_image_builder:rubocop']
end
