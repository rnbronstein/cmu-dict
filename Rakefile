require 'pry'

task :environment do
 require_relative './config/environment.rb'
end

desc 'database migration functions'
namespace :db do
  task :migrate => :environment do
    ActiveRecord::Migrator.migrate("db/migrations/")
  end
  task :drop => :environment do
    File.delete("db/pronunciations.db") if File.exist?("db/pronunciations.db")
  end
  task :reset => [:drop, :migrate] do
  end
end

desc 'drop into the Pry console'
task :console => :environment do
  Pry.start
end
