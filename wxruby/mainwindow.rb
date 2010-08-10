require 'rubygems'
require 'wx'
require 'wx_sugar/all'


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
      @sizer = Wx::VBoxSizer.new
      @mainpane = self
      @mainpane.sizer = @sizer
      gridpane(@mainpane)
      textpane(@mainpane)
    end
    
    def gridpane(panel)
      @grd = Wx::Grid.new(panel, -1)
      @grd.create_grid(12, 12) #creates a built-in underlying table. replace with Grid#set_table to hook up to model
      panel.sizer.add @grd, 2, Wx::GROW|Wx::ALL, 2

    end
    
    def textpane(panel)
      @txt = Wx::TextCtrl.new(
            panel, 
            :value => 'Type in here',
            :style => Wx::TE_MULTILINE
          )
      panel.sizer.add @txt, 1, Wx::GROW|Wx::ALL, 2
    end

    def setup_events
    end
end