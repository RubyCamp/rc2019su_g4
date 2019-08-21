module Title
  class Director
    def initialize
      @bg_img = Image.load("images/background_title.png")
      @timer = 3 * 60
    end

    def play
      Window.draw(0, 0, @bg_img)
      @timer -= 1
      if @timer <= 0
        Scene.move_to(:puzzle)
      end
    end
  end
end
