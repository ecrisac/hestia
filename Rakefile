require "bundler/gem_tasks"
require "rake/testtask"
require 'gemfury'
require 'gemfury/command'

module Bundler
  # Override rubygem_push to push to gemfury instead when doing `rake release`
  class GemHelper
    def rubygem_push(path)
      ::Gemfury::Command::App.start(['push', path, '--as', 'mixbook'])
    end
  end
end

Rake::TestTask.new("spec") do |t|
  t.test_files = Dir.glob("spec/**/*_spec.rb")
end

task(:default => :spec)

namespace :spec do
  desc "Run specs across all gemfiles"
  task :all do
    Dir["Gemfile*"].reject {|name| name[".lock"] }.each do |gemfile|
      sh "BUNDLE_GEMFILE=#{gemfile} bundle exec rake spec"
    end
  end
end
