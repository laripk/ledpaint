require 'rubygems'
require 'wx'
require 'wx_sugar/all'


class AppWx < Wx::App
  def on_init
    @mn = MainWindow.new
    @mn.show(true)
  end
end

#----- MainWindow -------------------------------------
class MainWindow < Wx::Frame
  public
    def initialize()
      super(nil, :title => "LED Paint",
          :style => Wx::DEFAULT_FRAME_STYLE | Wx::TAB_TRAVERSAL,
          :size => [600,400]
        )
        setup_controls
        setup_events
    end
    
  protected
    def setup_controls
    end

    def setup_events
    end
end

AppWx.new.main_loop