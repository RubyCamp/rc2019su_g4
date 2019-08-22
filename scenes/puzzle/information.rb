class Information < Sprite
  attr_accessor :image, :showed

  def initialize(x, y, z, image)
    super(x, y, image)
    self.z = z
    @showed = false
  end

end
