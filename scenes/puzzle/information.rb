class Information < Sprite
  attr_accessor :image

  def initialize(x, y, z, image)
    super(x, y, image)
    self.z = z
  end

end
