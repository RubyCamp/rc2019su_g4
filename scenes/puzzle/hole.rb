class Hole < Sprite
#  attr_accessor :movable, :half_x, :half_y

  def initialize(x, y, z, image)
    super(x, y, image)
#    @movable = true
    self.z = z
#    @half_x = image.width / 2
#    @half_y = image.height / 2
  end

=begin
  def movable_change
    if @movable == true
      @movable = false
    elsif @movable == false
      @movable = true
    end
  end
=end

end
