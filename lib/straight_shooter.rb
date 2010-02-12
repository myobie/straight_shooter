require "Qt"
require "qtwebkit"
require "straight_shooter/page"

class StraightShooter
  
  attr_accessor :page, :app
  
  def self.render(url, filename = nil)
    self.new(url, filename).run!
  end
  
  def initialize(url, filename = nil)
    self.app = Qt::Application.new(ARGV)
    self.page = Page.new(ARGV[0], ARGV[1])
    page.connect(page, SIGNAL('finished(bool)'), app, SLOT('quit()'))
  end
  
  def run
    page.load!
    app.exec
  end
  alias :run! :run
  
end