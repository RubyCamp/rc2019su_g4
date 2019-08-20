require 'dxruby'
Window.width = 900
Window.height = 600

s1 = Sprite.new(100, 100, Image.load('shijimi.png'))  # 穴を設定
s2 = Sprite.new(400, 100, Image.load('shijimi_black.png'))  # ピースを設定

#マウスカーソルが画像の上にあるかどうか
def image_mouse_over?(sprite, draw_x, draw_y)
  Input.mouse_x.between?(sprite.x, sprite.x + sprite.image.width) &&
  Input.mouse_y.between?(sprite.y, sprite.y + sprite.image.height)
end

#画像がドラッグできるかどうか
def image_mouse_drug?(sprite, draw_x, draw_y)
  Input.mouse_down?(M_LBUTTON) && image_mouse_over?(sprite, draw_x, draw_y)
end

Window.loop do
  s2.draw  # ピースを描画する
  s1.draw  # 穴を描画する
  draw_x = Input.mouse_x  # マウスカーソルのx座標
  draw_y = Input.mouse_y  # マウスカーソルのy座標
  if image_mouse_drug?(s1, draw_x, draw_y) then
    s1.x = draw_x - 100  # 画像サイズが200*200なので-100
    s1.y = draw_y - 100  # 画像サイズが200*200なので-100
    s1.draw
  end
end
