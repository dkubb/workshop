# frozen_string_literal: true

require 'open3'

DATABASE = 'workshop'

task default: %i(setup)

desc 'Set up database'
task :setup do
  output, status = Open3.capture2e(*%W(createdb --encoding utf-8 #{DATABASE}))

  unless status.success? || output.match?(/\bERROR:\s+database "#{DATABASE}" already exists$/)
    $stderr.puts "Database creation failed with unexpected error: #{output}"
    exit 1
  end

  puts "Database #{DATABASE.inspect} created"

  output, status = Open3.capture2e(*%W(psql --file schema.sql #{DATABASE}))

  if status.success?
    puts 'Added trades table'
  else
    $stderr.puts "Schema setup failed with error: #{output}"
    exit 1
  end
end
