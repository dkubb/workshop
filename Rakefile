# frozen_string_literal: true

require 'open3'

DATABASE = 'workshop'

task default: %i(setup)

desc 'Set up database'
task :setup do
  output, status = Open3.capture2e(*%W(createuser --host 127.0.0.1 --port 5432 #{DATABASE}))

  unless status.success? || output.match?(/\bERROR:\s+role "#{DATABASE}" already exists$/)
    $stderr.puts "Role creation failed with unexpected error: #{output}"
    exit 1
  end

  puts "Role #{DATABASE.inspect} created"

  output, status = Open3.capture2e(*%W(createdb --host 127.0.0.1 --port 5432 --encoding utf-8 #{DATABASE}))

  unless status.success? || output.match?(/\bERROR:\s+database "#{DATABASE}" already exists$/)
    $stderr.puts "Database creation failed with unexpected error: #{output}"
    exit 1
  end

  puts "Database #{DATABASE.inspect} created"

  output, status = Open3.capture2e(*%W(psql --host 127.0.0.1 --port 5432 --file schema.sql #{DATABASE}))

  if status.success?
    puts 'Added trades table'
  else
    $stderr.puts "Schema setup failed with error: #{output}"
    exit 1
  end
end
