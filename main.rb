require 'dxruby'
require_relative 'piece'
require_relative 'hole'
require_relative 'prefecture'
Window.width = 900
Window.height = 600

p1 = Piece.new(100, 100, Image.load('images/shijimi.png'))  # ピースを設定
h1 = Hole.new(400, 100, Image.load('images/shijimi_hole.png'))  # 穴を設定
p2 = Piece.new(100, 400, Image.load('images/matsue.png'))  # ピースを設定
h2 = Hole.new(400, 400, Image.load('images/matsue_hole.png'))  # 穴を設定

prefectures = [Prefecture.new(p1, h1),
               Prefecture.new(p2, h2)]

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
def piece_in_place?(piece, hole)
  piece.x.between?(hole.x-5, hole.x+5) &&
  piece.y.between?(hole.y-5, hole.y+5)
end

def draw_loop(prefecture)
  prefecture.hole.draw  # 穴を描画
  prefecture.piece.draw
  draw_x = Input.mouse_x  # マウスカーソルのx座標
  draw_y = Input.mouse_y  # マウスカーソルのy座標
  if image_mouse_drug?(prefecture.piece, draw_x, draw_y) then
    # 画像サイズの中心を操作できるように調整
    prefecture.piece.x = draw_x - prefecture.piece.half_x
    prefecture.piece.y = draw_y - prefecture.piece.half_y
    prefecture.piece.draw
  end
  if piece_in_place?(prefecture.piece, prefecture.hole) then
    p prefecture.piece.movable
    prefecture.piece.x = prefecture.hole.x  # ピースを穴の位置に調整
    prefecture.piece.y = prefecture.hole.y  # ピースを穴の位置に調整
    prefecture.piece.draw
    prefecture.piece.movable_change  # ピースを動かないようにする
  end
end

Window.loop do
  2.times do |i|
    draw_loop(prefectures[i])
  end
end
