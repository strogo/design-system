# frozen_string_literal: true

task default: :check

def collect_task_errors(tasks)
  errors = tasks.each_with_object([]) do |task, memo|
    Rake::Task[task].invoke
  rescue RuntimeError
    memo << task
  end

  errors.count.positive? && raise("The following tasks failed #{errors}")
end

namespace :design_system do
  desc "All Design System Tests"
  task :all do
    puts "Running all design system tests"
    system(
      "cd ./testing && bundle exec cucumber -p reports && cd .."
    ) || raise
  end
end

desc "Run all checks in the local context"
task :check do
  collect_task_errors([
    "ruby:lint",
    "npm:test"
  ])
end

namespace :ruby do
  desc "Lint ruby files"
  task :lint do
    collect_task_errors([
      "ruby:rubocop",
      "ruby:haml_lint"
    ])
  end

  desc "Rubocop Linting"
  task :rubocop do
    puts "Running rubocop linter"
    system("bundle exec rubocop") || raise
  end

  desc "Haml Linting"
  task :haml_lint do
    puts "Running haml-lint"
    system("bundle exec haml-lint haml styleguide") || raise
  end
end

namespace :npm do
  desc "Run node test"
  task :test do
    collect_task_errors([
      "npm:lint",
      "npm:jest"
    ])
  end

  desc "Run jest tests in node"
  task jest: :build do
    puts "Running jest tests"
    system("npm run jest") || raise
  end

  desc "Run linting jobs in node"
  task lint: :build do
    puts "Running Node lint"
    system("npm run lint") || raise
  end

  desc "Build Node files"
  task :build do
    puts "Compiling files"
    system("npm run build") || raise
  end
end
