require 'dal/rom_setup'

$ROM = ROM.setup(:sql, 'postgres://pms:fp123@localhost/pms_dev')

class SurfacesRelations < ROM::Relation[:sql]
  def by_id(id)
    where(id: id)
  end
end

$ROM.finalize

$rom = $ROM.env


pry
