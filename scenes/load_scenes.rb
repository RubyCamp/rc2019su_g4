require_relative 'title/director'
require_relative 'puzzle/director'
require_relative 'ending/director'

Scene.add(Title::Director.new,  :title)
Scene.add(Puzzle::Director.new,  :puzzle)
Scene.add(Ending::Director.new,  :ending)
