$LOAD_PATH.unshift File.dirname(__FILE__)

namespace :db do
  desc 'Run migrations'
  task :migrate, [:version] do |t, args|
    require 'sequel'
    Sequel.extension :migration

    db = Sequel.connect("postgres://pms:fp123@localhost/pms_#{ENV['ENV']}")
    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(db, 'db/migrations', target: args[:version].to_i)
    else
      puts 'Migrating to latest'
      Sequel::Migrator.run(db, 'db/migrations')
    end
  end
  desc 'Rollback migrations'
  task :rollback, :target do |t, args|
    require 'sequel'
    Sequel.extension :migration
    db = Sequel.connect("postgres://pms:fp123@localhost/pms_#{ENV['ENV']}")
    if args[:version]
      version = args[:version].to_i
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(db, 'db/migrations', target: version)
    else
      version = (row = db[:schema_info].first) ? row[:version] : nil
      puts "Rolling back to  #{version - 1}"
      Sequel::Migrator.run(db, 'db/migrations', target: version - 1)
    end
  end
  desc 'Seed database'
  task :seed do |t, args|
    require 'sequel'
    require 'db/initial_seed'
    time = Time.now
    puts 'Seeding into database'
    db = Sequel.connect("postgres://pms:fp123@localhost/pms_#{ENV['ENV']}")
    ContactsSeeder.new.seed.each do |cnt|
      db[cnt.table_name].insert(cnt.to_hash.merge({:created_at => time, :updated_at => time}))
    end
  end
end