class Piece < Sprite
  attr_accessor :movable

  def initialize(x, y, image)
    super
    @movable = true
    @half_x = image.width % 2
    @half_y = image.height % 2
  end

  def movable_change
    if @movable == true
      @movable = false
    elsif @movable == false
      @movable = true
    end
  end

end
