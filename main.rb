require 'dxruby'

require_relative 'scene'
require_relative 'scenes/load_scenes'

Window.caption = "RubyCamp Example"
Window.width   = 900
Window.height  = 600
Window.bgcolor = [255, 255, 255, 255]
Window.caption = "島根パズル"

Scene.move_to(:title)

Window.loop do
  break if Input.keyPush?(K_ESCAPE)

  Scene.play
end
