require_relative 'piece'
require_relative 'hole'
require_relative 'information'
require_relative 'prefecture'

module Puzzle
  class Director
    def initialize

=begin
      @p1 = Piece.new(100, 100, Image.load('images/shijimi.png'))  # ピースを設定
      @h1 = Hole.new(400, 100, Image.load('images/shijimi_hole.png'))  # 穴を設定
      @p2 = Piece.new(100, 400, Image.load('images/matsue.png'))  # ピースを設定
      @h2 = Hole.new(400, 400, Image.load('images/matsue_hole.png'))  # 穴を設定

      @prefectures = [Prefecture.new(@p1, @h1),
                      Prefecture.new(@p2, @h2)]
=end

      @p1 = Piece.new(647, 75, Image.load('images/p1.png'))
      @p2 = Piece.new(694, 164, Image.load('images/p2.png'))
      @p3 = Piece.new(423, 402, Image.load('images/p3.png'))
      @p4 = Piece.new(619, 297, Image.load('images/p4.png'))
      @p5 = Piece.new(576, 181, Image.load('images/p5.png'))
      @p6 = Piece.new(738, 237, Image.load('images/p6.png'))
      @p7 = Piece.new(538, 366, Image.load('images/p7.png'))
      @p8 = Piece.new(549, 269, Image.load('images/p8.png'))
      @p9 = Piece.new(778, 187, Image.load('images/p9.png'))
      @p10 = Piece.new(618, 428, Image.load('images/p10.png'))
      @p11 = Piece.new(519, 476, Image.load('images/p11.png'))
      @p12 = Piece.new(685, 441, Image.load('images/p12.png'))
      @p13 = Piece.new(712, 341, Image.load('images/p13.png'))
      @p14 = Piece.new(445, 322, Image.load('images/p14.png'))
      @p15 = Piece.new(771, 101, Image.load('images/p15.png'))
      @p16 = Piece.new(358, 398, Image.load('images/p16.png'))
      @p17 = Piece.new(310, 476, Image.load('images/p17.png'))

      @h1 = Hole.new(388, 75, -1, Image.load('images/h1.png'))
      @h2 = Hole.new(439, 125, -1, Image.load('images/h2.png'))
      @h3 = Hole.new(303, 107, -1, Image.load('images/h3.png'))
      @h4 = Hole.new(338, 151, -1, Image.load('images/h4.png'))
      @h5 = Hole.new(393, 196, -1, Image.load('images/h5.png'))
      @h6 = Hole.new(232, 189, -1, Image.load('images/h6.png'))
      @h7 = Hole.new(318, 223, -1, Image.load('images/h7.png'))
      @h8 = Hole.new(275, 243, -1, Image.load('images/h8.png'))
      @h9 = Hole.new(250, 263, -1, Image.load('images/h9.png'))
      @h10 = Hole.new(184, 262, -1, Image.load('images/h10.png'))
      @h11 = Hole.new(231, 294, -1, Image.load('images/h11.png'))
      @h12 = Hole.new(112, 295, -1, Image.load('images/h12.png'))
      @h13 = Hole.new(58, 365, -1, Image.load('images/h13.png'))
      @h14 = Hole.new(51, 422, -1, Image.load('images/h14.png'))
      @h15 = Hole.new(78, 461, -1, Image.load('images/h15.png'))
      @h16 = Hole.new(184, 103, -1, Image.load('images/h16.png'))
      @h17 = Hole.new(130, 159, -1, Image.load('images/h17.png'))

      @i1 = Information.new(0, 0, Image.load('images/shijimi.png'))


      @prefectures = [Prefecture.new(@p1, @h1, @i1),
                      Prefecture.new(@p2, @h2, @i1),
                      Prefecture.new(@p3, @h3, @i1),
                      Prefecture.new(@p4, @h4, @i1),
                      Prefecture.new(@p5, @h5, @i1),
                      Prefecture.new(@p6, @h6, @i1),
                      Prefecture.new(@p7, @h7, @i1),
                      Prefecture.new(@p8, @h8, @i1),
                      Prefecture.new(@p9, @h9, @i1),
                      Prefecture.new(@p10, @h10, @i1),
                      Prefecture.new(@p11, @h11, @i1),
                      Prefecture.new(@p12, @h12, @i1),
                      Prefecture.new(@p13, @h13, @i1),
                      Prefecture.new(@p14, @h14, @i1),
                      Prefecture.new(@p15, @h15, @i1),
                      Prefecture.new(@p16, @h16, @i1),
                      Prefecture.new(@p17, @h17, @i1)]
=begin
      @prefectures = [Prefecture.new(@p1, @h1),
                      Prefecture.new(@p2, @h2),
                      Prefecture.new(@p3, @h3),
                      Prefecture.new(@p4, @h4),
                      Prefecture.new(@p5, @h5),
                      Prefecture.new(@p6, @h6),
                      Prefecture.new(@p7, @h7),
                      Prefecture.new(@p8, @h8),
                      Prefecture.new(@p9, @h9),
                      Prefecture.new(@p10, @h10),
                      Prefecture.new(@p11, @h11),
                      Prefecture.new(@p12, @h12),
                      Prefecture.new(@p13, @h13),
                      Prefecture.new(@p14, @h14),
                      Prefecture.new(@p15, @h15),
                      Prefecture.new(@p16, @h16),
                      Prefecture.new(@p17, @h17)]
=end
      @having = nil
    end

    #マウスカーソルが画像の上にあるかどうか
    def image_mouse_over?(piece, draw_x, draw_y)
      Input.mouse_x.between?(piece.x, piece.x + piece.image.width) &&
      Input.mouse_y.between?(piece.y, piece.y + piece.image.height)
    end

    #画像をクリックしているかどうか
    def image_mouse_click?(piece, draw_x, draw_y)
      Input.mouse_down?(M_LBUTTON) && image_mouse_over?(piece, draw_x, draw_y)
    end

    #画像がドラッグできるかどうか
    def image_mouse_drug?(piece, draw_x, draw_y)
      image_mouse_click?(piece, draw_x, draw_y) &&
      piece.movable == true && (@having == nil || @having == piece)
    end

    #ピースが穴にはまったかどうか
    def piece_in_place?(piece, hole)
      piece.x.between?(hole.x-5, hole.x+5) &&
      piece.y.between?(hole.y-5, hole.y+5)
    end

    #全てのピースがはまったか
    def clear?()
      @prefectures.all? do |prefecture|
        prefecture.piece.movable == false
      end
    end

    def draw_loop(prefecture)
      prefecture.hole.draw  # 穴を描画
      prefecture.piece.draw
      draw_x = Input.mouse_x  # マウスカーソルのx座標
      draw_y = Input.mouse_y  # マウスカーソルのy座標
      if image_mouse_click?(prefecture.piece, draw_x, draw_y) == false
        @having = nil  # 画像をクリックしていない場合はhavingをnilに戻す
      end
      if image_mouse_drug?(prefecture.piece, draw_x, draw_y)
        # 画像サイズの中心を操作できるように調整
        prefecture.piece.x = draw_x - prefecture.piece.half_x
        prefecture.piece.y = draw_y - prefecture.piece.half_y
        prefecture.piece.draw
        p @having
        @having = prefecture.piece
        p @having
#        @having = prefecture.piece
      end
      if piece_in_place?(prefecture.piece, prefecture.hole)
        prefecture.piece.x = prefecture.hole.x  # ピースを穴の位置に調整
        prefecture.piece.y = prefecture.hole.y  # ピースを穴の位置に調整
        prefecture.piece.draw
        prefecture.piece.movable_change  # ピースを動かないようにする
      end
    end

    def play
      17.times do |i|
        draw_loop(@prefectures[i])
        if clear?
          Scene.move_to(:ending)
        end
      end
    end

  end
end
