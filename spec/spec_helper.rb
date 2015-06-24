$LOAD_PATH.unshift File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), '..'))


require 'rspec'
require 'pry'
require 'byebug'
require 'sequel'

RSpec.configure do |c|
  c.around(:each) do |example|
    @db = Sequel.postgres('pms_test', :user => 'pms', :password => 'fp123', :host => 'localhost')
    @db.transaction(:rollback=>:always, :auto_savepoint=>true){example.run}
  end
end