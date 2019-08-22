module Ending
  class Director
    FONT_SIZE = 50
    def initialize
      Window.bgcolor = [255, 255, 255, 255]
      @image = Image.load('images/imageB.png')
      @image_scroll_y = 0
      @timer = 30 * 60
      @words = %w(
「製作者」
	AmiYamamoto
	石橋惇
	佐々木コウシ
	Nojun
	ロリコン『あっきー＠妹募集中』
	.
	.
		.
	「協力」
	Ruby合宿
	島根県
	青少年自然の家サン・レイク
	.
	.
	.
	.
	ThankYou!!
        )
      @font = Font.new(FONT_SIZE, 'MS 明朝', weight: true, color: [0,0,0])
      @scroll_y = 0
    end

    def play
      @image_scroll_y += 1
      image_draw_x = 0
      image_draw_y = Window.height - @image_scroll_y	
      Window.draw(image_draw_x, image_draw_y, @image)
       
      @scroll_y += 1
      frame_out = []
      @timer -= 1
      
	 @words.each_with_index do |word, i|
          draw_x = Window.width / 3
          draw_y = (Window.height + i * FONT_SIZE + 600) - @scroll_y
	  color = [0,0,0]
          Window.draw_font(draw_x, draw_y, word, @font, color: color)
	if @timer <= 0
	   exit
	 end
      end
    end
  end
end
