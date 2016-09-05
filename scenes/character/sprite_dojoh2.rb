class Dojoh < Sprite
  BOTTOM = 520
  attr_accessor :type
  def initialize(x, y, image = nil)
    @@imanum = [Image.load("images/dojo/degasho_dojo.png"),
	Image.load("images/dojo/isshiy_dojo.png"),
	Image.load("images/dojo/miwa_dojo.png"),
	Image.load("images/dojo/nagachi_dojo.png"),
	Image.load("images/dojo/toikkii_dojo.png")]	
    @type = rand(5)
    image = @@imanum[@type]
    image.set_color_key([255, 255, 255])
    super
    @dx = 1
  end

  def update
    self.x -= @dx
    if self.x < 0
        self.x = rand(800..1000)
        self.y = rand(300..BOTTOM)
        @type = rand(5)
        self.image = @@imanum[@type]
    end
    if self.x > Window.width
        self.x = rand(800..1000)
        self.y = rand(300..BOTTOM)
        @dx *= -1
        @type = rand(5)
        self.image = @@imanum[@type]
    end
    #@dx = -@dx if self.x > (Window.width - self.image.width) || self.x < 0
    self.y += Math.sin(self.x / 10) * 5
    if self.y > BOTTOM
        self.y = BOTTOM
    end
  end

  def hit(obj)
    #@dx = -@dx
	self.x = rand(800..900)
  end
end
