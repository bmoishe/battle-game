class Player
 DEFAULT_HIT_POINTS = 60
  attr_reader :name, :hp

  def initialize(name, hp = DEFAULT_HIT_POINTS)
    @name = name
    @hp = hp
  end

  def take_damage
    @hp -= 10
  end

end
