

class Campaign

  def initialize(campaign_hash)
    @name, @start_time, @end_time, @id = campaign_hash.values_at(:name, :start_time, :end_time, :id)
    if (campaign_hash[:surfaces])
      add_surfaces(campaign_hash[:surfaces])
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