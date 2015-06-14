require 'singleton'
require 'models/person'

class PersonRepository
	include Singleton
	class SavingError < StandardError; end

	def initialize
		@all_data ||= []
		init_data
	end

	def save(object)
		fail SavingError.new('String object isn\'t valid') unless object.valid?
		@all_data.push(object)
	end

	def del(id)
		delete = find_by_id(id)
		@all_data.delete(delete)
	end

	def update(object)
		@all_data.delete(find_by_id(object.id))
		@all_data.push(object)
	end

	def find_by_id (id)
		@all_data.find do |e|
			e.id == id
		end 
	end

	def find_all
		@all_data
	end

	def init_data
		@all_data.push(Person.new('Mirko', 'Cerovac', nil))
		@all_data.push(Person.new('Nikica', 'Jokić', nil))
	end

end