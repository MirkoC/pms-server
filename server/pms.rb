$LOAD_PATH.unshift File.dirname(__FILE__)

require 'roda'
require 'json'
require 'models'

class Pms < Roda
  plugin :all_verbs

  route do |r|
    r.root do
      response['Content-Type'] = 'application/json'

      Person.new('mirko cerovac').to_json
      # {name: 'mirkoc'}.to_json
    end
  end
end

