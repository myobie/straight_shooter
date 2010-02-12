require "Qt"
require "qtwebkit"

class Page < Qt::Object

  slots 'started()', 'render(bool)'

  attr_accessor :url, :filename, :web, :page

  def app
    @app ||= Qt::Application.new(ARGV)
  end

  def initialize(url, filename = nil)
    super()
    
    new_app
    
    self.url = url
    self.filename = filename ? filename.gsub(/.png$/, "") + ".png" : url.split("//").last.split("/").first + ".png"

    self.web = Qt::WebView.new
    self.page = web.page

    connect(web, SIGNAL("loadStarted()"), self, SLOT('started()'))
    connect(web, SIGNAL("loadFinished(bool)"), self, SLOT('render(bool)'))
  end

  def load
    web.load(Qt::Url.new(url))
  end
  alias load! load

  def started
    puts "Loading #{url}..."
  end

  def render(ok)
    if ok
      puts "Rendering..."
      frame = page.current_frame
      page.set_viewport_size(frame.contents_size)
      image = Qt::Image.new(page.viewport_size, Qt::Image::Format_ARGB32)
      paint = Qt::Painter.new(image)
      frame.render(paint)
      paint.end
      image.save(filename) ? puts("Saved to #{filename}") : puts("Failed to save")
    else
      puts "Page failed to load. No image was saved."
    end

    quit_app
  end
  
  def quit_app
    app.quit
  end

end