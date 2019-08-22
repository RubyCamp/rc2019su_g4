module Title
  class Director
    def initialize
      @bg_img = Image.load("images/background_title.png")
    end

    def play
      Window.draw(0, 0, @bg_img)
      if Input.key_push?(K_SPACE)
        Scene.move_to(:puzzle)
      end
    end
  end
end
