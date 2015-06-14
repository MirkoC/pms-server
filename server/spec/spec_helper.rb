$LOAD_PATH.unshift File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), '..'))


require 'rspec'
require 'pry'
require 'byebug'

#RSpec.configure do |c|
#  c.around(:each) do |example|
#    DB.transaction(:rollback=>:always, :auto_savepoint=>true){example.run}
#  end
#end