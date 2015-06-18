require 'models'
require 'sequel'


class ContactsSeeder
  def seed
    contacts ||= []
    contacts.push(Contact.new('Nikica Jokić',  'Mladost 3', 'Zagreb', 'Grad Zagreb', 'Hrvatska', '10000', 'nikica@fp.com', '555-4555'))
    contacts.push(Contact.new('Mirko Cerovac', 'Selska 23', 'Zagreb', 'Grad Zagreb', 'Hrvatska', '10000', 'mirko@fp.com', '555-6555'))
    contacts.push(Contact.new('Veljko Dragšić', 'Trešnjevka 7', 'Zagreb', 'Grad Zagreb', 'Hrvatska', '10000', 'veljko@fp.com', '555-3555'))
    contacts
  end

end