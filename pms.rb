$LOAD_PATH.unshift File.dirname(__FILE__)

require 'rubygems'
require 'bundler'

require 'bundler/setup'
require 'json'
require 'models'
require 'pry'
require 'pg'
require 'byebug'
require 'sequel'
require 'roda'
require 'rom-sql'
require 'data_access_layer'



require 'representers'

db = Sequel.postgres('pms_dev', :user => 'pms', :password => 'fp123', :host => 'localhost')

class Pms < Roda
  plugin :all_verbs
  plugin :json, :classes=>[Array, Hash, Contact, SurfaceRepresenter]

  route do |r|
    r.root do
      #response['Content-Type'] = 'application/json'
    end
    r.on 'api' do
      # /contacts branch
      r.on 'contacts' do
        r.is do
          ############## GET /contacts ##############
          r.get do
            $contact_rep.get_all
          end
          ############## POST /contacts ##############
          r.post do
            contact = Contact.new(r['name'], r['street_address'], r['city'], r['state'], r['country'],
                                  r['postal_code'], r['email'], r['phone'])
            $contact_rep.create(contact)
          end
        end
        ############## PUT /contacts/:id ##############
        r.put ':id' do |id|
          contact = Contact.new(r['name'], r['street_address'], r['city'], r['state'], r['country'], r['postal_code'],
                                r['postal_code'], r['email'], id)
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
      # /surfaces branch
      r.on 'surfaces' do
        r.is do
          ############## GET /surfaces ##############
          r.get do

            $rom.relation(:surfaces).to_a

            #user_names.to_a
            #SurfaceRepresenter.new(surface)

          end
          ############## POST /surfaces ##############
          r.post do

          end
        end
        ############## PUT /surfaces/:id ##############
        r.put ':id' do
        end
        ############## GET /surfaces/:id ##############
        r.get ':id' do |id|
          pry
          surfaces_by_id = $rom.relation(:surfaces).by_id
          surfaces_by_id.(id)
        end
        ############## DELETE /surfaces/:id ##############
        r.delete ':id' do

        end
      end
    end
  end
end

