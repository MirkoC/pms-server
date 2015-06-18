require 'json'

class Billboard

  def table_name
    self.class.name.downcase.pluralize.to_sym
  end

  def initialize(billboard_hash, id = nil)
    @location, @price, @rent, @direction, @height, @line, @date_of_setting, @date_of_dismantling, @sales_started,
        @sales_ended, @taken_off, @taken_until, @remark, @frame, @lighted, @gas_station, @shopping_centers,
        @tram_bus_stop, @prohibition_of_alcohol, @prohibition_of_tobacco, @political_restrictions, @other_restrictions =
        billboard_hash.values_at(:location, :price, :rent, :direction, :height, :line, :date_of_setting,
                                 :date_of_dismantling, :sales_started, :sales_ended, :taken_off, :taken_until, :remark,
                                 :frame, :lighted, :gas_station, :shopping_centers, :tram_bus_stop, :prohibition_of_alcohol,
                                 :prohibition_of_tobacco, :political_restrictions, :other_restrictions)
    @id = id
  end

  attr_reader :location, :price, :rent, :direction, :height, :line, :date_of_setting,
              :date_of_dismantling, :sales_started, :sales_ended, :taken_off, :taken_until, :remark,
              :frame, :lighted, :gas_station, :shopping_centers, :tram_bus_stop, :prohibition_of_alcohol,
              :prohibition_of_tobacco, :political_restrictions, :other_restrictions, :id

  def ==(other)
    other.class == self.class && other.state == self.state
  end

  def state
    self.instance_variables.map { |var| self.instance_variable_get var }
  end

end