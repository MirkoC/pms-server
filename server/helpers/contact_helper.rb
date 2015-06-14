require 'models/contact'
require 'byebug'



def compare_for_update(old_contact, new_contact)
  old_contact.instance_variables.reject do |var|
    byebug
    var == :'@id'
  end.map do |var|
    puts var
    if (old_contact.var != new_contact.var)
      [var.to_s.delete("@").to_sym, self.instance_variable_get(var)]
      puts '-------------------------> true'
    end
  end
end