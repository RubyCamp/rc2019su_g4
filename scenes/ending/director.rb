module Ending
  class Director
    def initialize
      @bg_img = Image.load("images/background_ending.png")
      @timer = 3 * 60
    end

    def play
      Window.draw(0, 0, @bg_img)
      @timer -= 1
      if @timer <= 0
        exit
      end
    end
  end
end
