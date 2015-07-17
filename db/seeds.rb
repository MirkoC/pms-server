# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


location1 = Location.create({:name => 'Prva lokacija', :street_address => 'Preradovićeva 40', :city => 'Zagreb',
                  :state => 'Grad Zagreb', :region => 'Grad Zagreb i Zagrebačka županija', :country => 'Hrvatska',
                  :postal_code => '10000'})

location2 = Location.create({:name => 'Druga lokacija', :street_address => 'Ronjgova 43', :city => 'Zagreb',
                  :state => 'Grad Zagreb', :region => 'Grad Zagreb i Zagrebačka županija', :country => 'Hrvatska',
                  :postal_code => '10000'})

surface_type1 = SurfaceType.create({:name => 'billboard'})
surface_type2 = SurfaceType.create({:name => 'city_light'})

surface1 = Surface.create({:code => 'SRF01', :price => 100, :location_id => location1[:id], :surface_type_id => surface_type1[:id]})
surface2 = Surface.create({:code => 'SRF02', :price => 500, :location_id => location1[:id], :surface_type_id => surface_type2[:id]})

surface3 = Surface.create({:code => 'SRF03', :price => 300, :location_id => location2[:id], :surface_type_id => surface_type1[:id]})
surface4 = Surface.create({:code => 'SRF04', :price => 700, :location_id => location2[:id], :surface_type_id => surface_type2[:id]})

campaign1 = Campaign.create({:name_of_campaign => 'Erste kampanja', :start_time => '2015-07-03 13:59:59', :end_time => '2015-07-17 13:59:59'})
campaign2 = Campaign.create({:name_of_campaign => 'Tele2 kampanja', :start_time => '2015-08-14 13:59:59', :end_time => '2015-08-28 13:59:59'})

campaign1.add_surfaces([surface1, surface4])
campaign2.add_surfaces([surface1, surface2, surface3])

poster_worker1 = PosterWorker.create({:name => 'Nikica Jokić', :street_address => 'Riječka ulica 2', :city => 'Rijeka',
                                   :state => 'Primorsko Goranska Županija', :country => 'Hrvatska', :postal_code => '51000',
                                   :email => 'nikica@fp.com', :phone => '098 666 6266'})

poster_worker2 = PosterWorker.create({:name => 'Veljko Dragšić', :street_address => 'Ozaljska 31', :city => 'Zagreb',
                                   :state => 'Grad Zagreb', :country => 'Hrvatska', :postal_code => '10000',
                                   :email => 'veljko@fp.com', :phone => '097 555 5355'})

poster_worker3 = PosterWorker.create({:name => 'Mirko Cerovac', :street_address => 'Selska 23', :city => 'Zagreb',
                                   :state => 'Grad Zagreb', :country => 'Hrvatska', :postal_code => '10000',
                                   :email => 'mirko@fp.com', :phone => '095 111 1311'})

posting_order1 = PostingOrder.create({:issue_date => '2015-07-04 13:59:59', :state => 'active', :code => 'PO01',
                                   :surface_id => surface1[:id], :poster_worker_id => poster_worker1[:id]})

posting_order2 = PostingOrder.create({:issue_date => '2015-07-04 13:59:59', :state => 'active', :code => 'PO01',
                                   :surface_id => surface4[:id], :poster_worker_id => poster_worker3[:id]})
