# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Location.create([{:name => 'Prva lokacija', :street_address => 'Preradovićeva 40', :city => 'Zagreb',
                  :state => 'Grad Zagreb', :region => 'Grad Zagreb i Zagrebačka županija', :country => 'Hrvatska',
                  :postal_code => '10000'}])

Location.create([{:name => 'Druga lokacija', :street_address => 'Ronjgova 43', :city => 'Zagreb',
                  :state => 'Grad Zagreb', :region => 'Grad Zagreb i Zagrebačka županija', :country => 'Hrvatska',
                  :postal_code => '10000'}])