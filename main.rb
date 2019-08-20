require 'dxruby'
require_relative 'piece'
Window.width = 900
Window.height = 600

p1 = Piece.new(100, 100, Image.load('images/shijimi.png'))  # ピースを設定
p2 = Piece.new(400, 100, Image.load('images/shijimi_black.png'))  # 穴を設定

#マウスカーソルが画像の上にあるかどうか
def image_mouse_over?(piece, draw_x, draw_y)
  Input.mouse_x.between?(piece.x, piece.x + piece.image.width) &&
  Input.mouse_y.between?(piece.y, piece.y + piece.image.height)
end

#画像がドラッグできるかどうか
def image_mouse_drug?(piece, draw_x, draw_y)
  Input.mouse_down?(M_LBUTTON) && image_mouse_over?(piece, draw_x, draw_y) &&
  piece.movable == true
end

#ピースが穴にはまったかどうか
def piece_in_place?(piece1, piece2)
  piece1.x.between?(piece2.x-5, piece2.x+5) &&
  piece1.y.between?(piece2.y-5, piece2.y+5)
end

Window.loop do
  p2.draw  # 穴を描画する
  p1.draw  # ピースを描画する
  draw_x = Input.mouse_x  # マウスカーソルのx座標
  draw_y = Input.mouse_y  # マウスカーソルのy座標
  if image_mouse_drug?(p1, draw_x, draw_y) then
    p1.x = draw_x - 100  # 画像サイズが200*200なので-100
    p1.y = draw_y - 100  # 画像サイズが200*200なので-100
    p1.draw
    if piece_in_place?(p1, p2) then
      p1.x = p2.x
      p1.y = p2.y
      p1.draw
      p1.movable_change
    end
  end
end
