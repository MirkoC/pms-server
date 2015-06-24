

class Contract

  def initialize(contract_hash)
    @name, @start_time, @end_time, @id = contract_hash.values_at(:name, :start_time, :end_time, :id)
    if (contract_hash[:surfaces])
      add_surfaces(contract_hash[:surfaces])
    else
      @surfaces ||= []
    end
  end

  attr_reader :name, :start_time, :end_time, :surfaces, :id

  def add_surfaces(surfaces)
    @surfaces = surfaces.uniq do |surf|
      surf
    end
  end

end