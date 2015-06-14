$LOAD_PATH.unshift File.dirname(__FILE__)

require 'rubygems'
require 'bundler'

Bundler.require
require 'json'
require 'models'
require 'repository'
require 'pry'
require 'pg'
require 'byebug'

db = Sequel.postgres('pms_dev', :user => 'pms', :password => 'fp123', :host => 'localhost')

$contact_rep = ContactRepository.new(db)

class Pms < Roda
  plugin :all_verbs
  plugin :json, :classes=>[Array, Hash, Person]

  route do |r|
    r.root do
      #response['Content-Type'] = 'application/json'
    end
    # /people branch
    r.on 'api' do
      r.on 'contact' do
        r.is do
          ############## GET /contact ##############
          r.get do
            $contact_rep.get_all
          end
          ############## PUT /contact ##############
          r.put do
            $contact_rep.update(Contact.new(r['name'], r['street_address'], r['city'], r['state'], r['country'], r['postal_code'], nil,
                                     Time.now), r['id'])
            r['id']
          end
        end
        ############## POST /contact/new ##############
        r.post 'new' do
          c = Contact.new(r['name'], r['street_address'], r['city'], r['state'], r['country'], r['postal_code'], Time.now,
                          Time.now)
          $contact_rep.create(c)
        end
        ############## GET /contact/id ##############
        r.get ':id' do |id|
          $contact_rep.get_by_id(id)
        end
        ############## DELETE /contact/id ##############
        r.delete ':id' do |id|
          $contact_rep.delete(id)
        end
      end
    end
  end
end

