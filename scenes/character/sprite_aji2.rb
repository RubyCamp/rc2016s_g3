class Aji < Sprite
  BOTTOM = 520
  attr_accessor :type
  def initialize(x, y, image = nil)
    @@imanum = [Image.load("images/aji/isshy_aji.png"),Image.load("images/aji/degasho_aji.png"),Image.load("images/aji/miwa_aji.png"),Image.load("images/aji/nagachi_aji.png"),Image.load("images/aji/tokkii_aji.png")]
    @type = rand(5)
    image = @@imanum[@type]
    image.set_color_key([255, 255, 255])
    super
    @dx = 1
    @v0 = 30
    @v = @v0
    @g = 1
    @count = 1
  end

  def update
    self.x -=  @dx
    self.y -=  @v
    @v -= @g
    if self.x < 0
        @type = rand(5)
        self.image = @@imanum[@type]
        self.x = rand(800..1000)
    end
    if self.y > BOTTOM
        self.y = BOTTOM
        if @count < 3
            @count += 1
        else
            @count = 1
        end
        @v = @count * 10
    end
    #@dx = -@dx if self.x > (Window.width - self.image.width) || self.x < 0
  end
  
  def hit(obj)
    #@dx = -@dx if obj.is_a?(Ninjin)
    self.x = rand(800..900)
  end
end
