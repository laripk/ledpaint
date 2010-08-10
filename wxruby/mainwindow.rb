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
        @rows = 12
        @cols = 12
        @rowheight = 20
        @colwidth  = 20
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
      
      @grd.create_grid(@rows, @cols) #creates a built-in underlying table. replace with Grid#set_table to hook up to model
      
      @grd.set_row_label_size(0)
      @grd.set_col_label_size(0)
      @grd.set_default_row_size(@rowheight, true)
      @grd.set_default_col_size(@colwidth, true)
      @grd.disable_drag_grid_size
      @grd.disable_drag_col_size
      @grd.disable_drag_row_size
      
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