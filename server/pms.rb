$LOAD_PATH.unshift File.dirname(__FILE__)

require 'rubygems'
require 'bundler'

Bundler.require
require 'json'
require 'models'
require 'repositories'
require 'pry'
require 'pg'
require 'byebug'

db = Sequel.postgres('pms_dev', :user => 'pms', :password => 'fp123', :host => 'localhost')

$contact_rep = ContactRepository.new(db)

class Pms < Roda
  plugin :all_verbs
  plugin :json, :classes=>[Array, Hash, Contact]

  route do |r|
    r.root do
      #response['Content-Type'] = 'application/json'
    end
    # /people branch
    r.on 'api' do
      r.on 'contacts' do
        r.is do
          ############## GET /contacts ##############
          r.get do
            $contact_rep.get_all
          end
          ############## POST /contacts ##############
          r.post do
            contact = Contact.new(r['name'], r['street_address'], r['city'], r['state'], r['country'], r['postal_code'])
            $contact_rep.create(contact)
          end
        end
        ############## PUT /contacts/:id ##############
        r.put ':id' do |id|
          contact = Contact.new(r['name'], r['street_address'], r['city'], r['state'], r['country'], r['postal_code'], id)
          $contact_rep.update(contact, id)
          contact
        end
        ############## GET /contacts/:id ##############
        r.get ':id' do |id|
          $contact_rep.get_by_id(id)
        end
        ############## DELETE /contacts/:id ##############
        r.delete ':id' do |id|
          $contact_rep.delete(id)
        end
      end
    end
  end
end

